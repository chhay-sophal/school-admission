from django.contrib import admin
from django.urls import path, include
from index.views import *
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', include('index.urls')),
    path('admin/', admin.site.urls),
    path('account/', include('account.urls')),
    path('dashboard/', include('dashboard.urls')),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
