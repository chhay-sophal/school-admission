# Generated by Django 4.2.5 on 2023-09-06 04:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0017_alter_status_title'),
    ]

    operations = [
        migrations.AlterField(
            model_name='register',
            name='Status',
            field=models.ForeignKey(max_length=10, on_delete=django.db.models.deletion.CASCADE, to='index.status'),
        ),
    ]