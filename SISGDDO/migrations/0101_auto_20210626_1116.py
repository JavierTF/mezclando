# Generated by Django 2.2.7 on 2021-06-26 11:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0100_auto_20210626_0924'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sosi',
            name='ubicacion_salv',
            field=models.CharField(max_length=8, verbose_name='Ubicación de Salva*'),
        ),
    ]