# Generated by Django 2.2.7 on 2022-09-09 22:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0106_auto_20220909_2245'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dictamen_tecnico',
            name='entradas_proyectos',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SISGDDO.entradas_proyecto', verbose_name='Entradas Proyectos'),
        ),
        migrations.AlterField(
            model_name='eficacia',
            name='anno',
            field=models.DateField(default='2022-09-09', verbose_name='Año análisis de eficacia*'),
        ),
        migrations.AlterField(
            model_name='historico_entradas_proyectos',
            name='entradas_proyectos',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='entradas_proyectos', to='SISGDDO.entradas_proyecto', verbose_name='Entradas Proyectos'),
        ),
    ]
