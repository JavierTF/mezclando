# Generated by Django 2.2.7 on 2021-01-06 15:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0032_auto_20210106_1503'),
    ]

    operations = [
        migrations.AddField(
            model_name='indicador_eficacia',
            name='calif_ind',
            field=models.IntegerField(null=True, verbose_name='Calificación*'),
        ),
    ]
