# Generated by Django 2.2.7 on 2022-09-11 17:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0110_auto_20220909_2307'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='acciones_correptivas',
            new_name='acciones_correctivas',
        ),
        migrations.RenameModel(
            old_name='acciones_prevenntivas',
            new_name='acciones_preventivas',
        ),
        migrations.RenameField(
            model_name='trabajador',
            old_name='formacion',
            new_name='formacion_personal',
        ),
        migrations.RemoveField(
            model_name='eficacia',
            name='proceso',
        ),
        migrations.RemoveField(
            model_name='proceso',
            name='indicadores',
        ),
        migrations.AddField(
            model_name='auditoria_externa',
            name='proceso',
            field=models.ManyToManyField(to='SISGDDO.proceso', verbose_name='Proceso*'),
        ),
        migrations.AddField(
            model_name='eficacia',
            name='proceso_asociado',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='procesos_asociados', to='SISGDDO.proceso', verbose_name='Proceso asociado*'),
        ),
        migrations.AddField(
            model_name='eficacia',
            name='proceso_ef',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='procesos', to='SISGDDO.proceso', verbose_name='Proceso*'),
        ),
        migrations.AddField(
            model_name='indicador',
            name='proceso',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='SISGDDO.proceso', verbose_name='Proceso'),
        ),
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2022-09-11', verbose_name='Fecha de Cambio del Logotipo'),
        ),
        migrations.AlterField(
            model_name='dictamen_tecnico',
            name='entradas_proyectos',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SISGDDO.entradas_proyecto', verbose_name='Entradas Proyectos'),
        ),
        migrations.AlterField(
            model_name='eficacia',
            name='anno',
            field=models.DateField(default='2022-09-11', verbose_name='Año análisis de eficacia*'),
        ),
        migrations.AlterField(
            model_name='historico_entradas_proyectos',
            name='entradas_proyectos',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='entradas_proyectos', to='SISGDDO.entradas_proyecto', verbose_name='Entradas Proyectos'),
        ),
        migrations.AlterField(
            model_name='proceso',
            name='nombre',
            field=models.CharField(max_length=60, null=True, unique=True, verbose_name='Nombre del proceso*'),
        ),
        migrations.CreateModel(
            name='procedimiento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(max_length=10, null=True, unique=True, verbose_name='Código del procedimiento*')),
                ('nombre', models.CharField(max_length=60, verbose_name='Nombre del procedimiento*')),
                ('proceso', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SISGDDO.proceso', verbose_name='Proceso')),
            ],
        ),
    ]
