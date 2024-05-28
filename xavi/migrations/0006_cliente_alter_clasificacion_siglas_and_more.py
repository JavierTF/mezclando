# Generated by Django 4.1.3 on 2024-04-18 12:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('xavi', '0005_subclasificacion_siglas_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='cliente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(max_length=20, unique=True, verbose_name='nombre*')),
                ('nombre', models.CharField(max_length=65, unique=True, verbose_name='nombre*')),
                ('activo', models.BooleanField(default=True, verbose_name='activo*')),
            ],
        ),
        migrations.AlterField(
            model_name='clasificacion',
            name='siglas',
            field=models.CharField(max_length=6, verbose_name='siglas*'),
        ),
        migrations.AlterField(
            model_name='financiamiento_proyecto',
            name='ingreso',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='ingreso financiamiento*'),
        ),
        migrations.AlterField(
            model_name='financiamiento_proyecto',
            name='ingreso_real',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='ingreso real financiamiento*'),
        ),
        migrations.AlterField(
            model_name='financiamiento_proyecto',
            name='valor',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='valor financiamiento*'),
        ),
        migrations.AlterField(
            model_name='financiamiento_proyecto',
            name='valor_real',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='valor real financiamiento*'),
        ),
        migrations.AlterField(
            model_name='registro_aprobacion',
            name='contrato',
            field=models.CharField(max_length=20, null=True, verbose_name='contrato*'),
        ),
        migrations.AlterField(
            model_name='registro_aprobacion',
            name='ingreso_cup',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='ingreso en cup*'),
        ),
        migrations.AlterField(
            model_name='registro_aprobacion',
            name='ingreso_mlc',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='ingreso en mlc*'),
        ),
        migrations.AlterField(
            model_name='registro_reinicio',
            name='fecha_inicio',
            field=models.DateField(default='<built-in method now of type object at 0x5621839b5860>', verbose_name='fecha de inicio del reinicio'),
        ),
        migrations.AlterField(
            model_name='registro_terminacion',
            name='ingreso_cup',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='ingreso en cup*'),
        ),
        migrations.AlterField(
            model_name='registro_terminacion',
            name='ingreso_mlc',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='ingreso en mlc*'),
        ),
        migrations.AlterField(
            model_name='sosi',
            name='fecha',
            field=models.DateField(blank=True, default='2024-04-18', null=True, verbose_name='fecha de entrada*'),
        ),
        migrations.AlterField(
            model_name='subclasificacion',
            name='siglas',
            field=models.CharField(default='DES', max_length=6, verbose_name='siglas*'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='registro_terminacion',
            name='aprobado_por',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='registro_terminacion_cliente', to='xavi.cliente', verbose_name='verificado por*'),
        ),
    ]
