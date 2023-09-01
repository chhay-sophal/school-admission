from django import forms

class LoginForm(forms.Form):
    username = forms.CharField(max_length=65, widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(max_length=65, widget=forms.PasswordInput(attrs={'class': 'form-control'}))