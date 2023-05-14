# Generated by Django 2.2.7 on 2020-11-23 15:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='incidencias',
            fields=[
                ('no_conformidad_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='SISGDDO.No_Conformidad')),
                ('descripcion', models.TextField(verbose_name='Descripción*')),
                ('clasificacion', models.CharField(max_length=255, verbose_name='Clasificación*')),
            ],
            bases=('SISGDDO.no_conformidad',),
        ),
        migrations.CreateModel(
            name='reserva_cuadro',
            fields=[
                ('trabajador_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='SISGDDO.trabajador')),
                ('foto', models.ImageField(null=True, upload_to='media/foto/', verbose_name='Imagen*')),
                ('planilla', models.FileField(null=True, upload_to='media/planillas', verbose_name='Planilla*')),
            ],
            bases=('SISGDDO.trabajador',),
        ),
        migrations.CreateModel(
            name='atencion_cliente_externo',
            fields=[
                ('no_conformidad_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='SISGDDO.No_Conformidad')),
                ('via_recep', models.CharField(max_length=25, verbose_name='Vía de Recepción*')),
                ('cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SISGDDO.cliente_externo', verbose_name='Cliente Externo*')),
            ],
            bases=('SISGDDO.no_conformidad',),
        ),
    ]