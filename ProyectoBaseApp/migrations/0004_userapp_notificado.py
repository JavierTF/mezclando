# Generated by Django 4.1.3 on 2023-11-28 08:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ProyectoBaseApp', '0003_remove_userapp_notificado'),
    ]

    operations = [
        migrations.AddField(
            model_name='userapp',
            name='notificado',
            field=models.BooleanField(default=False, verbose_name='notificado*'),
        ),
    ]
