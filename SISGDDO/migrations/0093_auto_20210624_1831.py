# Generated by Django 2.2.7 on 2021-06-24 18:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0092_auto_20210624_1830'),
    ]

    operations = [
        migrations.AlterField(
            model_name='historico_dictamen_tecnico',
            name='fecha_envio_resultado',
            field=models.DateTimeField(blank=True, null=True, verbose_name='Fecha de Envío de Resultados*'),
        ),
    ]
