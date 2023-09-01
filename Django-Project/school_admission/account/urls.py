from django.urls import path
from . views import *
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('login', LoginView.as_view(), name="login"),
    path('logout', LogoutView.as_view(), name="logout"),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
