# Generated by Django 2.2.7 on 2021-01-03 11:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0025_auto_20201219_1828'),
    ]

    operations = [
        migrations.AddField(
            model_name='indicador_eficacia',
            name='proceso',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='SISGDDO.proceso', verbose_name='Proceso'),
        ),
    ]