# Generated by Django 2.2.7 on 2021-05-15 15:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0057_auto_20210511_1107'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='proyecto',
            name='resolusion_proyecto',
        ),
        migrations.AddField(
            model_name='proyecto',
            name='resolusion_jefe_proyecto',
            field=models.CharField(default='012', max_length=10, verbose_name='Resolución de jefe de proyecto*'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='cambiarlogotipo',
            name='fecha_cambio',
            field=models.DateField(default='2021-05-15', verbose_name='Fecha de Cambio del Logotipo'),
        ),
    ]
