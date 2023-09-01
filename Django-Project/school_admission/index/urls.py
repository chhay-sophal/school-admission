from django.urls import path
from . views import *

urlpatterns = [
    path('', IndexView.as_view(), name="index"),
    path('register/', RegisterView.as_view(), name="register"),
    path('expired/', ExpiredView.as_view(), name="expiredPage"),
    path('admission/', AdmissionView.as_view(), name="admission"),

    
    path('get_major_options/', get_major_options, name='get_major_options'),
]