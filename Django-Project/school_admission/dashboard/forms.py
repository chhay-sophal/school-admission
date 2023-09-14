from django import forms
from django.contrib.auth.models import *
from . models import *
from index.models import *

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

class ContactForm(forms.ModelForm):
    name = forms.CharField(max_length=50)
    icon = forms.CharField(max_length=100)
    text = forms.CharField(max_length=255)
    link = forms.CharField(max_length=255)

    class Meta:
        model = Contact
        fields = '__all__'

class DepartmentForm(forms.ModelForm):
    icon = forms.CharField(max_length=255)
    title = forms.CharField(max_length=50)

    class Meta:
        model = Department
        fields = '__all__'

class ExpiredForm(forms.ModelForm):
    batch = forms.IntegerField()
    year = forms.IntegerField()
    start_date = forms.DateField()
    expired_date = forms.DateField()
    start_class = forms.DateField()

    class Meta:
        model = Expired
        fields = '__all__'

class LevelForm(forms.ModelForm):
    title = forms.CharField(max_length=255)

    class Meta:
        model = Level
        fields = '__all__'

class MajorForm(forms.ModelForm):
    title = forms.CharField(max_length=50)
    description = forms.CharField(max_length=200)
    department = forms.ModelChoiceField(queryset=Department.objects.all())

    class Meta:
        model = Major
        fields = '__all__'

class PaymentForm(forms.ModelForm):
    title = forms.CharField(max_length=255)

    class Meta:
        model = Payment
        fields = '__all__'

class RatingForm(forms.ModelForm):
    rating = forms.IntegerField()
    name = forms.CharField(max_length=255)
    comments = forms.CharField(max_length=255)
    status = forms.BooleanField()

    class Meta:
        model = Ratings
        fields = '__all__'

class ShiftForm(forms.ModelForm):
    title = forms.CharField(max_length=255)

    class Meta:
        model = Shift
        fields = '__all__'

class TuitionFeeForm(forms.ModelForm):
    level = forms.ModelChoiceField(queryset=Level.objects.all())
    price = forms.DecimalField(max_digits=10, decimal_places=2)
    description = forms.CharField(max_length=255)

    class Meta:
        model = TuitionFee
        fields = '__all__'