from django.urls import path
from . views import *
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', DashboardView.as_view(), name="dashboard"),
    path('users', UsersView.as_view(), name="users"),
    path('user/add', AddUserView.as_view(), name="user_add"),
    path('user/delete/<int:pk>', DeleteUserView.as_view(), name="user_delete"),
    path('admission', AdmissionView.as_view(), name="admission"),
    path('curriculum', CurriculumView.as_view(), name="curriculum"),
    path('profile', ProfileView.as_view(), name="profile"),
    path('settings', SettingView.as_view(), name="setting"),
    path('settings/add/<str:tab>/', AddSettingsView.as_view(), name="settings_add"),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)