# Generated by Django 2.2.7 on 2021-06-25 10:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0097_auto_20210625_1032'),
    ]

    operations = [
        migrations.AlterField(
            model_name='auditoria_externa',
            name='titulo_inf',
            field=models.CharField(max_length=80, verbose_name='Título del Informe*'),
        ),
        migrations.AlterField(
            model_name='auditoria_interna',
            name='titulo_inf',
            field=models.CharField(max_length=80, verbose_name='Título del Informe*'),
        ),
    ]