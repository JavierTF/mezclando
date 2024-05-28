# Generated by Django 4.1.3 on 2023-12-19 11:01

import datetime
from django.db import migrations, models
import django.db.models.deletion
import xavi.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('base', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='accion_indicador_objetivo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('no', models.CharField(blank=True, max_length=10, null=True, verbose_name='número*')),
                ('codigo', models.CharField(blank=True, max_length=10, null=True, verbose_name='codigo*')),
                ('nombre', models.CharField(max_length=150, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='Activo*')),
            ],
        ),
        migrations.CreateModel(
            name='area',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=65, null=True, unique=True, verbose_name='nombre')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='clasificacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=80, unique=True, verbose_name='nombre*')),
                ('siglas', models.CharField(max_length=6, unique=True, verbose_name='siglas*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='estado_acuerdo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25, null=True, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='estado_entradas_proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='estado_indicador_objetivos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='estado_proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='estado_proyecto_dgca',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='etapa_proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, unique=True, verbose_name='nombre')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='evaluacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valor', models.CharField(max_length=3, unique=True, verbose_name='valor*')),
                ('nombre', models.CharField(max_length=100, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='financiamiento_proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valor', models.CharField(max_length=15, verbose_name='valor financiamiento*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='formato',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo')),
            ],
        ),
        migrations.CreateModel(
            name='fuente_financiamiento',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=80, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='linea_tematica',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=55, unique=True, verbose_name='nombre')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='objetivo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('no', models.CharField(blank=True, max_length=10, verbose_name='número*')),
                ('nombre', models.CharField(max_length=150, verbose_name='nombre*')),
                ('fecha_definicion', models.DateField(verbose_name='fecha de definición*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='periodo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, unique=True, verbose_name='nombre*')),
                ('orden', models.CharField(blank=True, max_length=3, null=True, verbose_name='orden*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='prioridad',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, unique=True, verbose_name='nombre')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('no', models.CharField(blank=True, max_length=10, null=True, unique=True, verbose_name='número*')),
                ('codigo', models.CharField(max_length=10, null=True, unique=True, verbose_name='código*')),
                ('nombre_proyecto', models.CharField(max_length=250, null=True, verbose_name='nombre de proyecto*')),
                ('creado', models.DateField(default=datetime.datetime.now, verbose_name='fecha de creado en base de datos*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('estado', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='xavi.estado_proyecto', verbose_name='estado*')),
            ],
        ),
        migrations.CreateModel(
            name='registro_aprobacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contrato', models.CharField(max_length=10, null=True, verbose_name='contrato*')),
                ('centro_costo', models.CharField(max_length=125, null=True, verbose_name='centro de costo*')),
                ('fecha_inicio', models.DateField(default=datetime.datetime.now, verbose_name='fecha de inicio*')),
                ('fecha_terminacion', models.DateField(blank=True, null=True, verbose_name='fecha de fin')),
                ('aprobacion_consejo', models.CharField(blank=True, max_length=25, null=True, verbose_name='aprobación Consejo Editorial')),
                ('fecha_aprobacion', models.DateField(blank=True, default=datetime.datetime.now, null=True, verbose_name='fecha de aprobación Consejo Editorial')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='registro_terminacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='tipo_extension',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, unique=True, verbose_name='nombre')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='tipo_moneda',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo')),
            ],
        ),
        migrations.CreateModel(
            name='tipo_proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='trabajador_registro',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='base.employee', verbose_name='trabajador*')),
                ('registro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.registro_aprobacion', verbose_name='registro de aprobación*')),
                ('rol', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='base.position', verbose_name='rol*')),
            ],
        ),
        migrations.CreateModel(
            name='trabajador_proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='base.employee', verbose_name='trabajador*')),
                ('proyecto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.proyecto', verbose_name='proyecto*')),
                ('rol', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='base.position', verbose_name='rol*')),
            ],
        ),
        migrations.CreateModel(
            name='trabajador_consecutivo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='base.employee', verbose_name='trabajador*')),
                ('rol', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='base.position', verbose_name='rol*')),
            ],
        ),
        migrations.CreateModel(
            name='subclasificacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=80, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('clasificacion', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='subclasificacion', to='xavi.clasificacion', verbose_name='clasificación*')),
            ],
        ),
        migrations.CreateModel(
            name='sosi',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero_salva', models.CharField(max_length=10, verbose_name='número*')),
                ('fecha', models.DateField(default='2023-12-19', verbose_name='fecha de entrega*')),
                ('anno', models.CharField(blank=True, max_length=4, null=True, verbose_name='año')),
                ('autor', models.CharField(blank=True, max_length=50, null=True, verbose_name='autor')),
                ('ubicacion_salva', models.CharField(blank=True, max_length=3, null=True, verbose_name='ubicación')),
                ('observaciones', models.CharField(blank=True, max_length=150, null=True, verbose_name='observaciones')),
                ('archivo', models.URLField(null=True, verbose_name='ruta del archivo')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('especialista', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='base.employee', verbose_name='trabajador que entrega*')),
                ('proyecto', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='sosi', to='xavi.proyecto', verbose_name='proyecto*')),
            ],
        ),
        migrations.AddField(
            model_name='registro_aprobacion',
            name='employee',
            field=models.ManyToManyField(through='xavi.trabajador_registro', to='base.employee', verbose_name='rol en el registro*'),
        ),
        migrations.AddField(
            model_name='registro_aprobacion',
            name='financiamiento',
            field=models.ManyToManyField(through='xavi.financiamiento_proyecto', to='xavi.fuente_financiamiento', verbose_name='financiamiento*'),
        ),
        migrations.AddField(
            model_name='registro_aprobacion',
            name='linea_tematica',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='xavi.linea_tematica', verbose_name='línea temática'),
        ),
        migrations.AddField(
            model_name='registro_aprobacion',
            name='prioridad',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='xavi.prioridad', verbose_name='prioridad*'),
        ),
        migrations.AddField(
            model_name='proyecto',
            name='registro_aprobacion',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='proyecto', to='xavi.registro_aprobacion', verbose_name='registro de aprobación*'),
        ),
        migrations.AddField(
            model_name='proyecto',
            name='subclasificacion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='proyectos', to='xavi.subclasificacion', verbose_name='subclasificación*'),
        ),
        migrations.CreateModel(
            name='premio',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=150, verbose_name='nombre*')),
                ('descripcion', models.CharField(blank=True, max_length=500, null=True, verbose_name='descripcion')),
                ('fecha', models.DateField(default=datetime.datetime.now, verbose_name='fecha*')),
                ('archivo', models.FileField(null=True, upload_to=xavi.models.premio.ruta, verbose_name='planilla de la Reserva')),
                ('activo', models.BooleanField(default=True, verbose_name='activo')),
                ('entidad', models.ForeignKey(on_delete=models.SET('CITMATEL'), to='base.entity', verbose_name='entidad*')),
            ],
        ),
        migrations.CreateModel(
            name='plan_ingreso_aprobacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valor', models.CharField(max_length=15, null=True, verbose_name='valor financiamiento*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('fuente_financiamiento', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.fuente_financiamiento', verbose_name='fuente de financiamiento*')),
                ('registro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.registro_aprobacion', verbose_name='registro de aprobación*')),
                ('tipo_moneda', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.tipo_moneda', verbose_name='rol*')),
            ],
        ),
        migrations.CreateModel(
            name='indicador_objetivos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('no', models.CharField(blank=True, max_length=10, unique=True, verbose_name='número*')),
                ('nombre', models.CharField(max_length=150, null=True, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo')),
                ('objetivo', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='objetivos', to='xavi.objetivo', verbose_name='objetivo')),
            ],
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='fuente_financiamiento',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.fuente_financiamiento', verbose_name='fuente de financiamiento*'),
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='proyecto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.proyecto', verbose_name='proyecto*'),
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='registro',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.registro_aprobacion', verbose_name='registro de aprobación*'),
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='tipo_moneda',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.tipo_moneda', verbose_name='rol*'),
        ),
        migrations.CreateModel(
            name='evaluacion_trimestral',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('evaluacion', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='evaluacion_trimestral', to='xavi.evaluacion', verbose_name='valor*')),
                ('objetivo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='evaluacion_trimestral', to='xavi.objetivo', verbose_name='objetivo*')),
                ('periodo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='evaluacion_trimestral', to='xavi.periodo', verbose_name='periodo*')),
            ],
        ),
        migrations.AddField(
            model_name='estado_proyecto',
            name='etapa',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='etapas', to='xavi.etapa_proyecto', verbose_name='Etapa de proyecto*'),
        ),
        migrations.CreateModel(
            name='entrada_proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_entrada', models.DateField(default=datetime.datetime.now, verbose_name='fecha*')),
                ('fecha_salida', models.DateField(null=True, verbose_name='Fecha de salida')),
                ('dictamen', models.FileField(blank=True, null=True, upload_to='entradas_proyectos/', verbose_name='informe apertura')),
                ('activo', models.BooleanField(default=True, verbose_name='Activo*')),
                ('entregado_por', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='base.employee', verbose_name='Trabajador que entrega')),
                ('estado', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='xavi.estado_entradas_proyecto', verbose_name='Estado entrada proyecto')),
                ('formato', models.ManyToManyField(to='xavi.formato', verbose_name='Formato*')),
                ('proyecto', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.proyecto', verbose_name='Proyecto*')),
            ],
        ),
        migrations.CreateModel(
            name='descripcion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(blank=True, max_length=500, null=True, verbose_name='descripcion*')),
                ('activo', models.BooleanField(default=True, verbose_name='Activo*')),
                ('fecha_creacion', models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creación')),
                ('accion', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='descripcion', to='xavi.accion_indicador_objetivo', verbose_name='acción*')),
                ('area', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='descripcion', to='xavi.area', verbose_name='área*')),
            ],
        ),
        migrations.CreateModel(
            name='calidad_proyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('proyecto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.proyecto', verbose_name='proyecto*')),
                ('rol', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='base.employee', verbose_name='rol en control de calidad*')),
            ],
        ),
        migrations.CreateModel(
            name='acuerdo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.CharField(max_length=6, null=True, unique=True, verbose_name='Número de acuerdo*')),
                ('nombre', models.CharField(max_length=125, null=True, verbose_name='Nombre del acuerdo*')),
                ('fecha', models.DateField(verbose_name='fecha*')),
                ('fecha_limite', models.DateField(null=True, verbose_name='fecha límite para cumplir')),
                ('fecha_cumplimiento', models.DateField(null=True, verbose_name='fecha de cumplimiento')),
                ('observaciones', models.TextField(null=True, verbose_name='observaciones')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('employee', models.ManyToManyField(to='base.employee', verbose_name='responsable*')),
                ('estado', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='xavi.estado_acuerdo', verbose_name='estado de acuerdo*')),
            ],
        ),
        migrations.AddField(
            model_name='accion_indicador_objetivo',
            name='indicador',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='accion', to='xavi.indicador_objetivos', verbose_name='indicador*'),
        ),
    ]