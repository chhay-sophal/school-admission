from django.shortcuts import render, get_object_or_404, redirect
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import *
from . models import *
from . forms import *
from index.models import *
from datetime import datetime
from django.views.generic.edit import *
from django.urls import reverse_lazy
from django.contrib import messages


class DashboardView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'

    def get(self, request):
        template_name = 'dashboard/overview.html'
        context = {
            'title': 'Dashboard',
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
        }
        return render(request, template_name, context)


class UsersView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'

    def get(self, request):
        template_name = 'dashboard/users.html'
        context = {
            'title': "Users",
            'users': User.objects.select_related('profile').all(),
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
        }
        return render(request, template_name, context)


class AddUserView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'

    def get(self, request):
        template_name = 'dashboard/user_add.html'
        user_form = UserForm()
        profile_form = ProfileForm()

        context = {
            'title': 'Add User',
            'profile_form': profile_form,
            'user_form': user_form,
        }
        return render(request, template_name, context)

    def post(self, request):
        template_name = 'dashboard/users.html'
        user_form = UserForm(request.POST)
        profile_form = ProfileForm(request.POST, request.FILES)
        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save(commit=False)
            user.set_password(user.password)
            user.save()

            profile = profile_form.save(commit=False)
            profile.user = user
            profile.save()
            return redirect('users')
        else:
            user_form = UserForm()
            profile_form = ProfileForm()

            print(profile_form.errors)

            context = {
                'profile_form': profile_form,
                'user_form': user_form,
            }
            return render(request, template_name, context)


class DeleteUserView(LoginRequiredMixin, DeleteView):
    model = User
    pk_url_kwarg = 'pk'
    template_name = 'dashboard/user_delete.html'
    success_url = reverse_lazy('users')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Delete User'
        return context

    def form_valid(self, form):
        self.object = self.get_object()
        self.object.delete()
        return redirect('users')


class AdmissionView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'

    def get(self, request):
        template_name = 'dashboard/admission.html'
        context = {
            'title': "Admission",
        }
        return render(request, template_name, context)


class CurriculumView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'

    def get(self, request):
        template_name = 'dashboard/curriculum.html'
        context = {
            'title': "Curriculum",
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
        }
        return render(request, template_name, context)


class ProfileView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'

    def get(self, request):
        template_name = 'dashboard/profile.html'
        context = {
            'title': "Profile",
        }
        return render(request, template_name, context)

    def post(self, request):
        form = User.objects.get(username=request.user.username)
        # Get user object
        user = request.user

        # Get cleaned data from form
        # password = form.cleaned_data['password']
        first_name = form.cleaned_data['first_name']
        last_name = form.cleaned_data['last_name']
        email = form.cleaned_data['email']

        # Update individual fields
        # user.set_password(password)
        user.first_name = first_name
        user.last_name = last_name
        user.email = email

        # Save updates
        user.save()

        return redirect('profile')


class SettingView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'

    def get(self, request):
        template_name = 'dashboard/setting.html'
        context = {
            'title': "Setting",
            'contacts': Contact.objects.all(),
            'departments': Department.objects.all(),
        }
        return render(request, template_name, context)
