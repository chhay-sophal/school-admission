from django.shortcuts import render
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import *
from .models import *
from index.models import *
from datetime import datetime

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
        
class AdmissionView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'
    def get(self, request):
        template_name = 'dashboard/admission.html'
        context = {
            'title': "Admission",
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
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
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
        }
        return render(request, template_name, context)    
    
class SettingView(LoginRequiredMixin, View):
    login_url = 'login'
    redirect_field_name = 'redirect_to'
    def get(self, request):
        template_name = 'dashboard/setting.html'
        context = {
            'title': "Setting",
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
        }
        return render(request, template_name, context)