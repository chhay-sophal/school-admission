# Generated by Django 4.2.2 on 2023-08-17 17:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0011_register'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='subject',
            name='title',
        ),
        migrations.AddField(
            model_name='subject',
            name='major',
            field=models.ForeignKey(default=1, limit_choices_to={'department__level': models.F('level')}, on_delete=django.db.models.deletion.CASCADE, to='index.major'),
            preserve_default=False,
        ),
    ]