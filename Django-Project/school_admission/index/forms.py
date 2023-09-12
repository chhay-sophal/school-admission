from .models import *
from django import forms
from crispy_forms.helper import FormHelper
from django.contrib.auth.models import *
from crispy_forms.layout import Layout, Submit, Row, Column, Fieldset, Div, HTML

class RegisterForm(forms.ModelForm):
    class Meta:
        model = Register
        fields = '__all__'
        exclude = ['Ref', 'Batch', 'Submit_Date', 'Status', 'Decided_By', 'Decided_Date', 'Reason']
