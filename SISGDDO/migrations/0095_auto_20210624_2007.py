# Generated by Django 2.2.7 on 2021-06-24 20:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0094_auto_20210624_1839'),
    ]

    operations = [
        migrations.AlterField(
            model_name='acciones',
            name='seguimiento',
            field=models.CharField(max_length=60, verbose_name='Seguimiento*'),
        ),
        migrations.AlterField(
            model_name='acuerdos_consejillo',
            name='fecha_cumplir',
            field=models.DateField(default='2021-01-01', help_text='la fecha debe ser Día/Mes/Año ejemplo 01/01/2020', verbose_name='Fecha Cumplir*'),
            preserve_default=False,
        ),
    ]