from django import forms
from django.contrib.auth.models import *
from . models import *

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['image', 'role']
        
class UserForm(forms.ModelForm):
    first_name = forms.CharField(max_length=100)
    last_name = forms.CharField(max_length=100)
    password = forms.CharField(max_length=128, widget=forms.PasswordInput)
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username', 'email', 'password', 'is_staff', 'is_active']