# Generated by Django 4.1.3 on 2024-02-23 11:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('xavi', '0002_alter_sosi_fecha'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sosi',
            name='fecha',
            field=models.DateField(default='2024-02-23', verbose_name='fecha de entrega*'),
        ),
    ]
