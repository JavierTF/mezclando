# Generated by Django 2.2.7 on 2021-06-03 12:39

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0062_auto_20210601_1355'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='permisos_personalizados',
            options={'permissions': [('grafico_RH', 'Ver grafico de RRHH'), ('grafico_Cap', 'Ver grafico de CAP'), ('grafico_CA', 'Ver grafico de C y A'), ('grafico_D', 'Ver grafico de Direccion'), ('grafico_I', 'Ver grafico de Inform'), ('grafico_Admin', 'Ver grafico de Admin')]},
        ),
        migrations.RemoveField(
            model_name='historico_entradas_proyectos',
            name='hora',
        ),
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2021-06-03', verbose_name='Fecha de Cambio del Logotipo'),
        ),
        migrations.AlterField(
            model_name='historico_entradas_proyectos',
            name='fecha',
            field=models.DateTimeField(default=datetime.datetime.now, verbose_name='Fecha'),
        ),
    ]