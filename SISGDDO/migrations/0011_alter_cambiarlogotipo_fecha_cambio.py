# Generated by Django 4.2.8 on 2024-05-28 20:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0010_alter_auditoria_externa_informe_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2024-05-28', verbose_name='Fecha de Cambio del Logotipo'),
        ),
    ]
