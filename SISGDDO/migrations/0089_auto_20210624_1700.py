# Generated by Django 2.2.7 on 2021-06-24 17:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0088_remove_dictamen_tecnico_area'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dictamen_tecnico',
            name='disennador',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='disennador', to='SISGDDO.trabajador', verbose_name='Diseñador'),
        ),
        migrations.AlterField(
            model_name='dictamen_tecnico',
            name='idioma_subtitulado',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='idioma_subtitulado', to='SISGDDO.idioma', verbose_name='Idioma de Subtitulado'),
        ),
        migrations.AlterField(
            model_name='dictamen_tecnico',
            name='nombre_capitulos',
            field=models.CharField(blank=True, max_length=25, null=True, verbose_name='Nombre de los Capítulos*'),
        ),
        migrations.AlterField(
            model_name='dictamen_tecnico',
            name='nuevo_idioma',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='nuevo_idioma', to='SISGDDO.idioma', verbose_name='Idioma de Subtitulado'),
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='activo',
            field=models.BooleanField(default=True, verbose_name='Activo'),
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='cargo',
            field=models.CharField(default='técnico', max_length=60, verbose_name='Cargo*'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='ci',
            field=models.CharField(blank=True, default=1999, max_length=11, null=True, verbose_name='Carnet de Identidad*'),
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='es_reserva',
            field=models.BooleanField(blank=True, default=False, null=True, verbose_name='Es Reserva'),
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='formacion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='SISGDDO.formacion_personal', verbose_name='Formación*'),
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='nombre_trabajador',
            field=models.CharField(default='yaciel', max_length=25, verbose_name='Nombre del Trabajador*'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='primer_apellido',
            field=models.CharField(default='perez', max_length=25, verbose_name='Primer Apellido*'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='trabajador',
            name='segundo_apellido',
            field=models.CharField(default='garcia', max_length=25, verbose_name='Segundo Apellido*'),
            preserve_default=False,
        ),
    ]