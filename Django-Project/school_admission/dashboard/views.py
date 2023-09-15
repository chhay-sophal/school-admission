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

        # Get all applications
        applications = Register.objects.all()

        # Filter applications
        pending_applications = applications.filter(Status__title='Pending')
        admitted_applications = applications.filter(Status__title='Admitted')
        denied_applications = applications.filter(Status__title='Denied')

        # Get all users
        users = User.objects.all()

        # Get all students
        students = admitted_applications

        # Get all ratings
        ratings = Ratings.objects.all()

        # Calculate counts for each rating
        rating_counts = {}
        for rating in ratings:
            rating_counts[rating.rating] = ratings.filter(rating=rating.rating).count()

        context = {
            'title': 'Dashboard',
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
            'applications': Register.objects.all(),
            'total_applications': applications.count(),
            'total_pending_applications': pending_applications.count(),
            'total_admitted_applications': admitted_applications.count(),
            'total_denied_applications': denied_applications.count(),
            'total_reviewed_applications': admitted_applications.count() + denied_applications.count(),
            'total_users': users.count(),
            'total_students': students.count(),
            'total_ratings': ratings.count(),
            'rating_counts': rating_counts,
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
            'title': "Settings",
            'contacts': Contact.objects.exclude(id=1),
            'departments': Department.objects.all(),
            'expireds': Expired.objects.all(),
            'levels': Level.objects.all(),
            'majors': Major.objects.all(),
            'payments': Payment.objects.all(),
            'ratingss': Ratings.objects.all(),
            'shifts': Shift.objects.all(),
            'tuitionfees': TuitionFee.objects.all(),
        }
        return render(request, template_name, context)

class AddSettingsView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'

    def get(self, request, tab):
        template_name = 'dashboard/settings_add.html'
        form = None
        tab = tab
        if tab == 'contact':
            form = ContactForm()
            subtitle = 'Contact'
        elif tab == 'department':
            form = DepartmentForm()
            subtitle = 'Department'
        elif tab == 'expired':
            form = ExpiredForm()
            subtitle = 'Expired'
        elif tab == 'level':
            form = LevelForm()
            subtitle = 'Level'
        elif tab == 'major':
            form = MajorForm()
            subtitle = 'Major'
        elif tab == 'payment':
            form = PaymentForm()
            subtitle = 'Payment'
        elif tab == 'rating':
            form = RatingForm()
            subtitle = 'Rating'
        elif tab == 'shift':
            form = ShiftForm()
            subtitle = 'Shift'
        elif tab == 'tuitionfee':
            form = TuitionFeeForm()
            subtitle = 'TuitionFee'

        print(tab)
        context = {
            'form': form,
            'subtitle': subtitle,
        }
        return render(request, template_name, context)

    def post(self, request, tab):
        template_name = 'dashboard/settings_add.html'
        form = None
        tab = tab
        if tab == 'contact':
            form = ContactForm(request.POST)
            subtitle = 'Contact'
        elif tab == 'department':
            form = DepartmentForm(request.POST)
            subtitle = 'Department'
        elif tab == 'expired':
            form = ExpiredForm(request.POST)
            subtitle = 'Expired'
        elif tab == 'level':
            form = LevelForm(request.POST)
            subtitle = 'Level'
        elif tab == 'major':
            form = MajorForm(request.POST)
            subtitle = 'Major'
        elif tab == 'payment':
            form = PaymentForm(request.POST)
            subtitle = 'Payment'
        elif tab == 'rating':
            form = RatingForm(request.POST)
            subtitle = 'Rating'
        elif tab == 'shift':
            form = ShiftForm(request.POST)
            subtitle = 'Shift'
        elif tab == 'tuitionfee':
            form = TuitionFeeForm(request.POST)
            subtitle = 'TuitionFee'

        if form.is_valid():
            form = form.save(commit=False)
            form.save()

            return redirect('settings')
        else:
            print(form.errors)

            context = {
                'form': form,
                'subtitile': subtitle,
            }
            return render(request, template_name, context)

class DeleteSettingsView(LoginRequiredMixin, DeleteView):
    model_map = {
        'contact': Contact,
        'department': Department,
        'expired': Expired,
        'level': Level,
        'major': Major,
        'payment': Payment,
        'rating': Ratings,
        'shift': Shift,
        'tuitionfee': TuitionFee,
    }
    success_url = reverse_lazy('settings')
    template_name = 'dashboard/settings_delete.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['subtitle'] = self.get_subtitle()
        return context
    
    def get_subtitle(self):
        model = self.get_object()
        return model._meta.verbose_name.capitalize() if model else ''

    def get_object(self):
        tab = self.kwargs['tab']
        pk = self.kwargs['pk']
        model = self.model_map.get(tab)
        if model:
            return model.objects.get(pk=pk)
        return None

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        if self.object:
            self.object.delete()
        return redirect(self.get_success_url())
    
class ModifySettingsView(LoginRequiredMixin, UpdateView):
    model_map = {
        'contact': Contact,
        'department': Department,
        'expired': Expired,
        'level': Level,
        'major': Major,
        'payment': Payment,
        'rating': Ratings,
        'shift': Shift,
        'tuitionfee': TuitionFee,
    }
    template_name = 'dashboard/settings_modify.html'
    success_url = reverse_lazy('settings')
    fields = '__all__'

    def get_object(self, queryset=None):
        tab = self.kwargs['tab']
        pk = self.kwargs['pk']
        model = self.model_map.get(tab)
        if model:
            return model.objects.get(pk=pk)
        return None

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['subtitle'] = self.get_subtitle()
        return context

    def get_subtitle(self):
        model = self.get_object()
        return model._meta.verbose_name.capitalize() if model else ''   