# Generated by Django 4.2.2 on 2023-08-13 12:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0002_alter_contact_link_alter_department_icon_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='department',
            name='icon',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='department',
            name='title',
            field=models.CharField(max_length=50),
        ),
    ]