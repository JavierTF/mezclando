# Generated by Django 2.2.7 on 2020-12-16 12:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SISGDDO', '0016_auto_20201210_1127'),
    ]

    operations = [
        migrations.AlterField(
            model_name='no_conformidad',
            name='nombre_conformifdad',
            field=models.CharField(max_length=55, verbose_name='Asunto'),
        ),
    ]