# Generated by Django 2.2.7 on 2020-11-24 16:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ProyectoBaseApp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userapp',
            name='image',
            field=models.ImageField(default='static/users/userDefault1.png', null=True, upload_to='media/foto', verbose_name='Avatar'),
        ),
    ]
