# Generated by Django 4.2.5 on 2023-09-06 04:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0016_alter_register_decided_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='status',
            name='title',
            field=models.CharField(max_length=20),
        ),
    ]