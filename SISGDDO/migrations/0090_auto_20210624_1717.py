# Generated by Django 2.2.7 on 2021-06-24 17:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0089_auto_20210624_1700'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dictamen_tecnico',
            name='documento',
            field=models.FileField(upload_to='dictamenes/', verbose_name='Documento*'),
        ),
    ]