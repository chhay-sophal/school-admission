import os
from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.db import models
from django.contrib.auth.models import User
from PIL import Image

def validate_file_extension(value): 
    ext = os.path.splitext(value.name)[1]
    valid_extensions = ['.png', '.jpg', '.jpeg']
    if not ext.lower() in valid_extensions:
        raise ValidationError(u'Unsupported file extension.')

Roles = (('Admin', 'Admin'), ('User', 'User'))

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(null=True, default='default.jpg', upload_to='profile',  validators=[validate_file_extension])
    role = models.TextField(max_length=10, choices=Roles)

    def __str__(self):
        return self.user.username
    
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        img = Image.open(self.image.path)
        if img.width > 300 or img.height > 300:
            output_size = (300, 300)
            img.thumbnail(output_size)
            img.save(self.image.path)
