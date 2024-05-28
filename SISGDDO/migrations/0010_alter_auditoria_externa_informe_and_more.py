# Generated by Django 4.2.8 on 2024-05-18 21:04

import SISGDDO.models
import SISGDDO.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0003_alter_logoentity_logo1_alter_logoentity_logo2'),
        ('xavi', '0011_alter_cliente_codigo_alter_proyecto_no_and_more'),
        ('SISGDDO', '0009_alter_cambiarlogotipo_fecha_cambio'),
    ]

    operations = [
        migrations.AlterField(
            model_name='auditoria_externa',
            name='informe',
            field=models.FileField(blank=True, null=True, upload_to='dictamenes/', validators=[SISGDDO.validators.valid_extension], verbose_name='Informe de la auditoría (PDF o Imagen)'),
        ),
        migrations.AlterField(
            model_name='auditoria_externa',
            name='plan_medidas',
            field=models.FileField(blank=True, null=True, upload_to='dictamenes/', validators=[SISGDDO.validators.valid_extension], verbose_name='Plan de medidas (PDF o Imagen)'),
        ),
        migrations.AlterField(
            model_name='auditoria_externa',
            name='registro',
            field=models.IntegerField(default=SISGDDO.models.auditoria_externa.number, verbose_name='Número de Registro'),
        ),
        migrations.AlterField(
            model_name='auditoria_interna',
            name='alcance',
            field=models.CharField(blank=True, max_length=250, null=True, verbose_name='Alcance de la auditoría'),
        ),
        migrations.AlterField(
            model_name='auditoria_interna',
            name='criterios',
            field=models.CharField(blank=True, max_length=250, null=True, verbose_name='Criterios de la auditoría'),
        ),
        migrations.AlterField(
            model_name='auditoria_interna',
            name='informe',
            field=models.FileField(blank=True, null=True, upload_to='dictamenes/', validators=[SISGDDO.validators.valid_extension], verbose_name='Informe de la auditoria(PDF o Imágen)'),
        ),
        migrations.AlterField(
            model_name='auditoria_interna',
            name='objetivos',
            field=models.CharField(blank=True, max_length=250, null=True, verbose_name='Objetivos de la auditoría'),
        ),
        migrations.AlterField(
            model_name='auditoria_interna',
            name='observaciones',
            field=models.CharField(blank=True, max_length=250, null=True, verbose_name='Observaciones de la auditoría'),
        ),
        migrations.AlterField(
            model_name='auditoria_interna',
            name='resultados',
            field=models.CharField(blank=True, max_length=150, null=True, verbose_name='Resultado'),
        ),
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2024-05-18', verbose_name='Fecha de Cambio del Logotipo'),
        ),
        migrations.AlterField(
            model_name='incidencia',
            name='descripcion',
            field=models.CharField(max_length=250, verbose_name='Comentarios'),
        ),
        migrations.AlterField(
            model_name='incidencia',
            name='ejecutante',
            field=models.ForeignKey(blank=True, db_column='ejecutante_id', null=True, on_delete=models.SET('Area eliminada'), related_name='ejecutante', to='xavi.area', verbose_name='Ejecutor'),
        ),
        migrations.AlterField(
            model_name='incidencia',
            name='proceso',
            field=models.ForeignKey(blank=True, null=True, on_delete=models.SET('Area eliminada'), to='base.process', verbose_name='Proceso asociado'),
        ),
        migrations.AlterField(
            model_name='incidencia',
            name='titulo',
            field=models.CharField(max_length=250, verbose_name='Asunto'),
        ),
        migrations.AlterField(
            model_name='incidencia',
            name='trabajador',
            field=models.ForeignKey(null=True, on_delete=models.SET('Trabajador eliminado'), to='base.employee', verbose_name='Reportado por'),
        ),
    ]
