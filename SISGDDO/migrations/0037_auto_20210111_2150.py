# Generated by Django 2.2.7 on 2021-01-11 21:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0036_auto_20210111_2114'),
    ]

    operations = [
        migrations.AlterField(
            model_name='trabajador',
            name='nombre_trabajador',
            field=models.CharField(max_length=25, null=True, verbose_name='Nombre del Trabajador*'),
        ),
    ]
