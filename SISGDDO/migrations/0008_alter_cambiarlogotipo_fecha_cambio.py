# Generated by Django 4.1.3 on 2024-04-30 12:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0007_alter_cambiarlogotipo_fecha_cambio'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2024-04-30', verbose_name='Fecha de Cambio del Logotipo'),
        ),
    ]
