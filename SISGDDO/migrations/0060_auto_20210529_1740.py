# Generated by Django 2.2.7 on 2021-05-29 17:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0059_auto_20210522_1819'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2021-05-29', verbose_name='Fecha de Cambio del Logotipo'),
        ),
    ]
