# Generated by Django 2.2.7 on 2020-12-02 18:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0011_auto_20201202_1805'),
    ]

    operations = [
        migrations.AlterField(
            model_name='no_conformidad',
            name='fecha_recibido',
            field=models.DateTimeField(help_text='la fecha debe ser Día/Mes/Año Hora:Min:Seg ejemplo 01/01/2020 00:00:00', verbose_name='Fecha Recibido*'),
        ),
    ]
