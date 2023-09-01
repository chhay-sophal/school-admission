from django.shortcuts import render, redirect
from django.views import *
from index.models import *
from datetime import datetime
from .forms import *
from django.contrib import messages
from django.contrib.auth import login, logout, authenticate

class LoginView(View):
    def get(self, request):
        if request.user.is_authenticated:
            return redirect('dashboard')
        
        template_name = 'account/login.html'
        form = LoginForm()

        context = {
            'title': "Login",
            'form': form,
            'school_info': Contact.objects.first(),
            'current_year': datetime.now().year,
        }
        return render(request, template_name, context)
    
    def post(self, request):
        form = LoginForm(request.POST)
        
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(request,username=username,password=password)
            if user:
                login(request, user)
                messages.success(request,f'Hi {username.title()}, welcome back!')
                return redirect('dashboard')
        
        messages.error(request,f'Invalid username or password')
        return render(request,'account/login.html',{'form': form})
    
class LogoutView(View):
    def get(self, request):
        logout(request)
        messages.success(request,f'You have been logged out.')
        return redirect('login')