# Generated by Django 2.2.7 on 2020-11-24 16:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ProyectoBaseApp', '0005_auto_20201124_1622'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userapp',
            name='image',
            field=models.ImageField(default='static/users/userDefault1.png', null=True, upload_to='foto/', verbose_name='Avatar'),
        ),
    ]