# Generated by Django 4.1.3 on 2023-12-19 11:01

import SISGDDO.models
import SISGDDO.storage
import SISGDDO.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('xavi', '0001_initial'),
        ('base', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CambiarLogotipo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_cambio', models.DateField(default='2023-12-19', verbose_name='Fecha de Cambio del Logotipo')),
                ('logo', models.ImageField(storage=SISGDDO.storage.OverwriteStorage(), upload_to='logo/', verbose_name='Logo*')),
            ],
        ),
        migrations.CreateModel(
            name='permisos_personalizados',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'permissions': [('grafico_RH', 'Ver grafico de RRHH'), ('grafico_Cap', 'Ver grafico de CAP'), ('grafico_CA', 'Ver grafico de C y A'), ('grafico_D', 'Ver grafico de Direccion'), ('grafico_I', 'Ver grafico de Inform'), ('grafico_Admin', 'Ver grafico de Admin')],
            },
        ),
        migrations.CreateModel(
            name='PlanTrabajo',
            fields=[
                ('activo', models.BooleanField(auto_created=True, default=True, verbose_name='Activo')),
                ('numero', models.AutoField(primary_key=True, serialize=False, verbose_name='No.')),
                ('nivel', models.CharField(max_length=80, verbose_name='Nivel Organizacional')),
            ],
        ),
        migrations.CreateModel(
            name='incidencia',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='No.')),
                ('titulo', models.CharField(max_length=250, verbose_name='Incidencia')),
                ('fecha_recepcion', models.DateField(verbose_name='Fecha de recepcion')),
                ('fecha_cierre', models.DateField(blank=True, null=True, verbose_name='Fecha de cierre')),
                ('hora', models.TimeField(default='00:00', verbose_name='Hora de recepcion')),
                ('descripcion', models.CharField(max_length=250, verbose_name='Descripción')),
                ('respuesta', models.TextField(blank=True, max_length=250, null=True, verbose_name='Respuesta')),
                ('estado', models.CharField(max_length=250, null=True, verbose_name='Estado')),
                ('activo', models.BooleanField(default=True, verbose_name='Activo')),
                ('ejecutante', models.ForeignKey(db_column='ejecutante_id', null=True, on_delete=models.SET('Area eliminada'), related_name='ejecutante', to='xavi.area', verbose_name='Ejecutor')),
                ('proceso', models.ForeignKey(null=True, on_delete=models.SET('Area eliminada'), to='base.process', verbose_name='Proceso asociado')),
                ('trabajador', models.ForeignKey(null=True, on_delete=models.SET('Area eliminada'), to='xavi.area', verbose_name='Reportado por')),
            ],
        ),
        migrations.CreateModel(
            name='auditoria_interna',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='No.')),
                ('fechainicio', models.DateField(null=True, verbose_name='Fecha de inicio de auditoría')),
                ('fechafin', models.DateField(null=True, verbose_name='Fecha de fin de auditoría')),
                ('titulo', models.CharField(max_length=150, null=True, verbose_name='Título del documento')),
                ('resultados', models.CharField(max_length=150, null=True, verbose_name='Resultado')),
                ('objetivos', models.CharField(max_length=250, null=True, verbose_name='Objetivos de la auditoría')),
                ('alcance', models.CharField(max_length=250, null=True, verbose_name='Alcance de la auditoría')),
                ('criterios', models.CharField(max_length=250, null=True, verbose_name='Criterios de la auditoría')),
                ('observaciones', models.CharField(max_length=250, null=True, verbose_name='Observaciones de la auditoría')),
                ('informe', models.FileField(null=True, upload_to='dictamenes/', validators=[SISGDDO.validators.valid_extension], verbose_name='Informe de la auditoria(PDF o Imágen)')),
                ('activo', models.BooleanField(default=True, verbose_name='Activo')),
                ('equipo', models.ManyToManyField(blank=True, to='base.employee', verbose_name='Equipo auditor')),
                ('proceso', models.ForeignKey(null=True, on_delete=models.SET('Proceso eliminado'), to='base.process', verbose_name='Proceso que se audita')),
            ],
        ),
        migrations.CreateModel(
            name='auditoria_externa',
            fields=[
                ('registro', models.IntegerField(auto_created=True, default=SISGDDO.models.auditoria_externa.number, null=True)),
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='No.')),
                ('fechainicio', models.DateField(null=True, verbose_name='Fecha de inicio de auditoría')),
                ('fechafin', models.DateField(null=True, verbose_name='Fecha de fin de auditoría')),
                ('titulo', models.CharField(max_length=150, null=True, verbose_name='Título del documento')),
                ('resultados', models.CharField(max_length=150, null=True, verbose_name='Resultado')),
                ('observaciones', models.CharField(blank=True, max_length=250, null=True, verbose_name='Observaciones')),
                ('informe', models.FileField(null=True, upload_to='dictamenes/', validators=[SISGDDO.validators.valid_extension], verbose_name='Informe de la auditoría (PDF o Imagen)')),
                ('plan_medidas', models.FileField(null=True, upload_to='dictamenes/', validators=[SISGDDO.validators.valid_extension], verbose_name='Plan de medidas (PDF o Imagen)')),
                ('activo', models.BooleanField(default=True, verbose_name='Activo')),
                ('entidad', models.ForeignKey(null=True, on_delete=models.SET('Entidad eliminada'), to='base.entity', verbose_name='Entidad')),
                ('proceso', models.ManyToManyField(blank=True, to='base.process', verbose_name='Procesos que se auditan')),
            ],
        ),
        migrations.CreateModel(
            name='Afectaciones',
            fields=[
                ('activo', models.BooleanField(auto_created=True, default=True, verbose_name='Activo')),
                ('numero', models.AutoField(primary_key=True, serialize=False, verbose_name='No.')),
                ('fecha_recepcion', models.DateTimeField(verbose_name='Fecha de recepción')),
                ('fecha_cierre', models.DateField(blank=True, null=True, verbose_name='Fecha de cierre')),
                ('afectacion', models.CharField(max_length=80, verbose_name='Afectación reportada')),
                ('observacionesactual', models.CharField(max_length=250, verbose_name='Observaciones Actuales')),
                ('estado', models.CharField(max_length=50, verbose_name='Estado')),
                ('formato', models.ForeignKey(blank=True, null=True, on_delete=models.SET('Formato eliminado de la Base de datos'), related_name='formatos_afectacion', to='xavi.formato', verbose_name='formato')),
                ('propuesto', models.ForeignKey(null=True, on_delete=models.SET('Departamento eliminado de la Base de datos'), related_name='propuesto', to='xavi.area', verbose_name='Solicitado por')),
                ('responsable', models.ForeignKey(null=True, on_delete=models.SET('Departamento eliminado de la Base de datos'), related_name='responsable', to='xavi.area', verbose_name='Ejecutor')),
            ],
        ),
        migrations.CreateModel(
            name='ActividadPlan',
            fields=[
                ('activo', models.BooleanField(auto_created=True, default=True, verbose_name='Activo')),
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='No.')),
                ('descripcion', models.CharField(max_length=80, null=True, verbose_name='Descripcion')),
                ('dia', models.DateField(verbose_name='Día de la actividad')),
                ('plan', models.CharField(default='', max_length=80, verbose_name='Plan al que pertenece')),
                ('hora', models.TimeField(verbose_name='Hora de la Actividad')),
                ('lugar', models.CharField(max_length=80, null=True, verbose_name='Lugar Previsto')),
                ('otro', models.CharField(default='', max_length=80, verbose_name='Otro Lugar')),
                ('participantes', models.ManyToManyField(blank=True, related_name='participantes', to='base.employee', verbose_name='Trabajadores que participan')),
                ('preside', models.ForeignKey(null=True, on_delete=models.SET('Trabajador eliminado de la Base de datos'), related_name='presidente', to='base.employee', verbose_name='Trabajador que preside')),
            ],
        ),
    ]
