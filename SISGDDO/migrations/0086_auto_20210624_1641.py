# Generated by Django 2.2.7 on 2021-06-24 16:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0085_auto_20210623_1402'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='dictamen_tecnico',
            name='proyecto',
        ),
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2021-06-24', verbose_name='Fecha de Cambio del Logotipo'),
        ),
    ]
