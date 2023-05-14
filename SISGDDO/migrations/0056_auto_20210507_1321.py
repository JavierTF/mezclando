# Generated by Django 2.2.7 on 2021-05-07 13:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0055_auto_20210503_1902'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2021-05-07', verbose_name='Fecha de Cambio del Logotipo'),
        ),
        migrations.RemoveField(
            model_name='sosi',
            name='coleccion',
        ),
        migrations.AddField(
            model_name='sosi',
            name='coleccion',
            field=models.ManyToManyField(to='SISGDDO.coleccion', verbose_name='Línea Temática*'),
        ),
        migrations.RemoveField(
            model_name='sosi',
            name='formatos',
        ),
        migrations.AddField(
            model_name='sosi',
            name='formatos',
            field=models.ManyToManyField(to='SISGDDO.formatos', verbose_name='Formatos*'),
        ),
        migrations.AlterField(
            model_name='sosi',
            name='persona_entrega',
            field=models.CharField(max_length=100, verbose_name='Trabajador que Entrega'),
        ),
        migrations.AlterField(
            model_name='sosi',
            name='persona_recibe',
            field=models.CharField(max_length=100, verbose_name='Trabajador que Recibe'),
        ),
    ]
