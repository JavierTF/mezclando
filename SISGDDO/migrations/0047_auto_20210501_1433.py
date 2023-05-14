# Generated by Django 2.2.7 on 2021-05-01 14:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0046_auto_20210128_1451'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='valoracion_encuesta',
            name='organismo',
        ),
        migrations.AddField(
            model_name='proceso',
            name='abreviatura',
            field=models.CharField(default='p', max_length=25, verbose_name='Abreviatura*'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='valoracion_encuesta',
            name='organismos',
            field=models.ManyToManyField(to='SISGDDO.organismo', verbose_name='Organismos*'),
        ),
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2021-05-01', verbose_name='Fecha de Cambio del Logotipo'),
        ),
        migrations.AlterField(
            model_name='sosi',
            name='autor',
            field=models.CharField(max_length=60, null=True, verbose_name='Autor'),
        ),
        migrations.AlterField(
            model_name='sosi',
            name='nombre_proy_prod',
            field=models.CharField(max_length=255, verbose_name='Nombre del Proyecto'),
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='cargo',
            field=models.CharField(max_length=50, null=True, verbose_name='Cargo*'),
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='ci',
            field=models.CharField(default=1999, max_length=11, verbose_name='Carnet de Identidad*'),
        ),
        migrations.AlterField(
            model_name='valoracion_encuesta',
            name='documento',
            field=models.FileField(upload_to='', verbose_name='Valoración de Encuesta*'),
        ),
        migrations.AlterField(
            model_name='valoracion_encuesta',
            name='fecha',
            field=models.DateField(verbose_name='Fecha*'),
        ),
    ]
