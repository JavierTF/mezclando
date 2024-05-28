# Generated by Django 4.1.3 on 2024-04-02 12:39

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0001_initial'),
        ('xavi', '0003_alter_sosi_fecha'),
    ]

    operations = [
        migrations.CreateModel(
            name='accion_control_etapa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, unique=True, verbose_name='nombre')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='control_etapa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='estado_software',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, unique=True, verbose_name='nombre')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.CreateModel(
            name='idioma',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo')),
            ],
        ),
        migrations.CreateModel(
            name='registro_reinicio',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_inicio', models.DateField(default='<built-in method now of type object at 0x55bed08fb860>', verbose_name='fecha de inicio del reinicio')),
                ('fecha_fin', models.DateField(verbose_name='fecha de fin del reinicio')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.RemoveField(
            model_name='financiamiento_proyecto',
            name='proyecto',
        ),
        migrations.RemoveField(
            model_name='sosi',
            name='anno',
        ),
        migrations.RemoveField(
            model_name='sosi',
            name='autor',
        ),
        migrations.AddField(
            model_name='area',
            name='centro_costo',
            field=models.CharField(default=1, max_length=10, verbose_name='centro de costo*'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='descripcion',
            name='area_principal',
            field=models.BooleanField(default=False, verbose_name='Área principal*'),
        ),
        migrations.AddField(
            model_name='entrada_proyecto',
            name='no',
            field=models.CharField(blank=True, max_length=10, verbose_name='número*'),
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='ingreso',
            field=models.CharField(blank=True, max_length=15, null=True, verbose_name='ingreso financiamiento*'),
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='ingreso_real',
            field=models.CharField(blank=True, max_length=15, null=True, verbose_name='ingreso real financiamiento*'),
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='registro_terminacion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.registro_terminacion', verbose_name='registro de terminación*'),
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='valor_real',
            field=models.CharField(blank=True, max_length=15, null=True, verbose_name='valor real financiamiento*'),
        ),
        migrations.AddField(
            model_name='plan_ingreso_aprobacion',
            name='registro_terminacion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.registro_terminacion', verbose_name='registro de terminación*'),
        ),
        migrations.AddField(
            model_name='proyecto',
            name='formato',
            field=models.ManyToManyField(related_name='proyecto', to='xavi.formato', verbose_name='formato'),
        ),
        migrations.AddField(
            model_name='registro_aprobacion',
            name='ingreso_cup',
            field=models.CharField(blank=True, max_length=10, null=True, verbose_name='ingreso en cup*'),
        ),
        migrations.AddField(
            model_name='registro_aprobacion',
            name='ingreso_mlc',
            field=models.CharField(blank=True, max_length=10, null=True, verbose_name='ingreso en mlc*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='aprobado_por',
            field=models.CharField(blank=True, max_length=130, null=True, verbose_name='aprobado por'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='fecha_ficha_tecnica',
            field=models.DateField(default=datetime.datetime.now, verbose_name='fecha de ficha técnica*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='fecha_revision',
            field=models.DateField(default=datetime.datetime.now, verbose_name='fecha de revisión*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='fecha_sosi',
            field=models.DateField(default=datetime.datetime.now, verbose_name='fecha de sosi*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='fecha_verificacion',
            field=models.DateField(default=datetime.datetime.now, verbose_name='fecha de verificación*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='financiamiento',
            field=models.ManyToManyField(blank=True, through='xavi.financiamiento_proyecto', to='xavi.fuente_financiamiento', verbose_name='financiamiento*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='ingreso_cup',
            field=models.CharField(blank=True, max_length=10, null=True, verbose_name='ingreso en cup*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='ingreso_mlc',
            field=models.CharField(blank=True, max_length=10, null=True, verbose_name='ingreso en mlc*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='no_ficha_tecnica',
            field=models.CharField(blank=True, max_length=5, null=True, verbose_name='número ficha técnica'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='no_sosi',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='registro_terminacion', to='xavi.sosi', verbose_name='sosi*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='proyecto',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='proyecto_registro_terminacion', to='xavi.proyecto', verbose_name='registro de terminación*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='recibida_por_sosi',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='registro_terminacion_recibida_sosi', to='base.employee', verbose_name='recibida por (sosi)*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='recibido_por_ficha_tecnica',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='registro_terminacion_recibido_ficha_tecnica', to='base.employee', verbose_name='recibido por (ficha técnica)*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='recomendaciones',
            field=models.CharField(blank=True, max_length=250, null=True, verbose_name='recomendaciones control de calidad'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='revisado_por',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='registro_terminacion_revisado', to='base.employee', verbose_name='revisado por*'),
        ),
        migrations.AddField(
            model_name='registro_terminacion',
            name='verificado_por',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='registro_terminacion_verificado', to='base.employee', verbose_name='verificado por*'),
        ),
        migrations.AddField(
            model_name='sosi',
            name='recibe',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.DO_NOTHING, related_name='recibe', to='base.employee', verbose_name='trabajador que recibe*'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='tipo_moneda',
            name='siglas',
            field=models.CharField(default=1, max_length=25, verbose_name='siglas*'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='area',
            name='nombre',
            field=models.CharField(max_length=65, unique=True, verbose_name='nombre*'),
        ),
        migrations.AlterField(
            model_name='entrada_proyecto',
            name='estado',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='xavi.estado_proyecto_dgca', verbose_name='Estado entrada proyecto'),
        ),
        migrations.AlterField(
            model_name='entrada_proyecto',
            name='proyecto',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='entradas', to='xavi.proyecto', verbose_name='Proyecto*'),
        ),
        migrations.AlterField(
            model_name='financiamiento_proyecto',
            name='fuente_financiamiento',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.fuente_financiamiento', verbose_name='fuente de financiamiento*'),
        ),
        migrations.AlterField(
            model_name='financiamiento_proyecto',
            name='registro',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.registro_aprobacion', verbose_name='registro de aprobación*'),
        ),
        migrations.AlterField(
            model_name='financiamiento_proyecto',
            name='tipo_moneda',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.tipo_moneda', verbose_name='tipo de moneda*'),
        ),
        migrations.AlterField(
            model_name='financiamiento_proyecto',
            name='valor',
            field=models.CharField(blank=True, max_length=15, null=True, verbose_name='valor financiamiento*'),
        ),
        migrations.AlterField(
            model_name='plan_ingreso_aprobacion',
            name='registro',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.registro_aprobacion', verbose_name='registro de aprobación*'),
        ),
        migrations.AlterField(
            model_name='registro_aprobacion',
            name='centro_costo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='xavi.area', verbose_name='centro de costo*'),
        ),
        migrations.AlterField(
            model_name='registro_aprobacion',
            name='financiamiento',
            field=models.ManyToManyField(blank=True, through='xavi.financiamiento_proyecto', to='xavi.fuente_financiamiento', verbose_name='financiamiento*'),
        ),
        migrations.AlterField(
            model_name='sosi',
            name='archivo',
            field=models.URLField(verbose_name='ruta del archivo'),
        ),
        migrations.AlterField(
            model_name='sosi',
            name='fecha',
            field=models.DateField(blank=True, default='2024-04-02', null=True, verbose_name='fecha de entrada*'),
        ),
        migrations.AlterField(
            model_name='tipo_extension',
            name='nombre',
            field=models.CharField(max_length=25, verbose_name='nombre*'),
        ),
        migrations.AlterField(
            model_name='tipo_moneda',
            name='nombre',
            field=models.CharField(max_length=80, unique=True, verbose_name='nombre*'),
        ),
        migrations.AlterField(
            model_name='trabajador_registro',
            name='rol',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='base.position', verbose_name='rol*'),
        ),
        migrations.AlterUniqueTogether(
            name='descripcion',
            unique_together={('accion', 'area')},
        ),
        migrations.CreateModel(
            name='trabajador_etapa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField(default=datetime.datetime.now, verbose_name='fecha de inicio*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('accion_control_etapa', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.accion_control_etapa', verbose_name='accion en el control de etapa*')),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='base.employee', verbose_name='trabajador*')),
                ('estado_software', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.estado_software', verbose_name='estado de software*')),
                ('registro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='xavi.control_etapa', verbose_name='control de etapa*')),
            ],
        ),
        migrations.CreateModel(
            name='registro_interrupcion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField(default=datetime.datetime.now, verbose_name='fecha de interrupción*')),
                ('motivo', models.CharField(blank=True, max_length=250, null=True, verbose_name='motivo')),
                ('aprobado_por', models.CharField(blank=True, max_length=130, null=True, verbose_name='aprobado por')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('financiamiento', models.ManyToManyField(blank=True, through='xavi.financiamiento_proyecto', to='xavi.fuente_financiamiento', verbose_name='financiamiento*')),
                ('propuesto_por', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='base.employee', verbose_name='propuesto por*')),
                ('proyecto', models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='proyecto_registro_interrupcion', to='xavi.proyecto', verbose_name='registro de interrupción*')),
            ],
        ),
        migrations.CreateModel(
            name='registro_extension',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('observaciones', models.CharField(blank=True, max_length=250, null=True, verbose_name='observaciones')),
                ('fecha_inicio', models.DateField(default=datetime.datetime.now, verbose_name='fecha de inicio*')),
                ('fecha_fin', models.DateField(default=datetime.datetime.now, verbose_name='fecha de fin*')),
                ('fecha_aprobacion', models.DateField(default=datetime.datetime.now, verbose_name='fecha de aprobación*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
                ('centro_costo', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='xavi.area', verbose_name='centro de costo*')),
                ('jefe_proyecto', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='base.employee', verbose_name='jefe de proyecto*')),
                ('proyecto', models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='proyecto_registro_extension', to='xavi.proyecto', verbose_name='registro de extensión*')),
                ('tipo_extension', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='xavi.tipo_extension', verbose_name='tipo de extensión*')),
            ],
        ),
        migrations.AddField(
            model_name='control_etapa',
            name='employee',
            field=models.ManyToManyField(through='xavi.trabajador_etapa', to='base.employee', verbose_name='rol en el registro*'),
        ),
        migrations.AddField(
            model_name='control_etapa',
            name='proyecto',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='proyecto_control_etapa', to='xavi.proyecto', verbose_name='registro de extensión*'),
        ),
        migrations.AddField(
            model_name='financiamiento_proyecto',
            name='registro_interrupcion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='xavi.registro_interrupcion', verbose_name='registro de interrupcion*'),
        ),
        migrations.AddField(
            model_name='registro_aprobacion',
            name='registro_reinicio',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='xavi.registro_reinicio', verbose_name='reinicio*'),
        ),
        migrations.AddField(
            model_name='sosi',
            name='idioma',
            field=models.ManyToManyField(blank=True, to='xavi.idioma', verbose_name='Idioma*'),
        ),
    ]