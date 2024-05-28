from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from SISGDDO.storage import OverwriteStorage
import uuid
import os


def model_upload_image(instance, filename):
    ext = filename.split('.')[-1]
    return "images/{0}/{1}.{2}".format(instance._meta.model.__name__.lower(), uuid.uuid4(), ext)


class Country(models.Model):
    name = models.CharField(max_length=150, verbose_name='Nombre')
    acronym = models.CharField(max_length=3, verbose_name='Siglas')
    active = models.BooleanField(default=True, verbose_name='Activo')

    class Meta:
        verbose_name = 'Country'
        verbose_name_plural = 'Countries'

    def __str__(self):
        return self.name


class Entity(models.Model):
    name = models.CharField(max_length=150, verbose_name='Entidad')
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class LogoEntity(models.Model):
    date = models.DateTimeField(auto_now_add=True)
    logo1 = models.ImageField(upload_to='home/access/mezclando/media/logo/', storage=OverwriteStorage(), verbose_name='Logo principal')
    logo2 = models.ImageField(upload_to='home/access/mezclando/media/logo/', storage=OverwriteStorage(), verbose_name='Logo secundario')

    class Meta:
        ordering = ('-date', )


class Position(models.Model):
    name = models.CharField(max_length=150, verbose_name='Nombre', unique=True)
    active = models.BooleanField(default=True, verbose_name='Activo')

    def __str__(self):
        return self.name


class ScientificCategory(models.Model):
    name = models.CharField(max_length=150, verbose_name="Nombres")
    prefix = models.CharField(max_length=15, verbose_name="Sigla", null=True, blank=True, default="")
    active = models.BooleanField(default=True, verbose_name="Activo")

    def __str__(self):
        return "{} ({})".format(self.name, "%s " % self.prefix if self.prefix else "")


class Employee(models.Model):
    scientific_category = models.ForeignKey(ScientificCategory, on_delete=models.SET_NULL, verbose_name="Categoría Científica", null=True, blank=True)
    first_name = models.CharField(max_length=150, verbose_name="Nombre")
    last_name = models.CharField(max_length=150, verbose_name="Apellidos")
    identification = models.CharField(max_length=11, verbose_name="Carnet de indentidad", unique=True)
    position = models.ForeignKey(Position, on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Cargo", related_name='employees')
    image = models.ImageField(upload_to=model_upload_image, verbose_name='Imagen del trabajador', null=True, blank=True)
    active = models.BooleanField(default=True, verbose_name="Activo")

    def __str__(self):
        return "{}{} {}".format("%s " % self.scientific_category.prefix if self.scientific_category else "", self.first_name, self.last_name)

    def get_full_name(self):
        return "{}{} {}".format("%s " % self.scientific_category.prefix if self.scientific_category else "", self.first_name, self.last_name)


class InfoEmployee(models.Model):
    employee = models.OneToOneField(Employee, on_delete=models.CASCADE, related_name='info')
    is_reserve = models.BooleanField(default=False, verbose_name="es reserva")
    init_date_reserve = models.DateField(verbose_name='fecha de inicio como reserva de cuadro', null=True, blank=True)
    finish_date_reserve = models.DateField(verbose_name='fecha de terminación como reserva de cuadro', null=True, blank=True)
    image_reserve = models.ImageField(upload_to=model_upload_image, verbose_name='imagen de la reserva', null=True, blank=True)
    spreadsheet_reserve = models.FileField(upload_to=model_upload_image, verbose_name='planilla de la reserva', null=True, blank=True)
    is_executive = models.BooleanField(default=False, verbose_name="es cuadro")
    init_date_executive = models.DateField(verbose_name='fecha de inicio como cuadro', null=True, blank=True)
    finish_date_executive = models.DateField(verbose_name='fecha de terminación como cuadro', null=True, blank=True)
    image_executive = models.ImageField(upload_to=model_upload_image, verbose_name='imagen del Cuadro', null=True, blank=True)
    spreadsheet_executive = models.FileField(upload_to=model_upload_image, verbose_name='planilla del cuadro', null=True, blank=True)


class ProcessClassifier(models.Model):
    name = models.CharField(max_length=150, unique=True, verbose_name='Nombre')
    active = models.BooleanField(default=True, verbose_name='Activo')
    
    def __str__(self) -> str:
        return self.name


class Process(models.Model):
    order = models.PositiveIntegerField(default=0)
    classifier = models.ForeignKey(ProcessClassifier, on_delete=models.CASCADE, null=True, blank=True, related_name='processes', verbose_name='Clasificación')
    name = models.CharField(max_length=150, unique=True, verbose_name='Nombre')
    abbreviation = models.CharField(max_length=15, verbose_name='Código')
    responsible = models.ForeignKey(Employee, on_delete=models.SET_NULL, null=True, verbose_name='Responsable')
    edition = models.CharField(max_length=3, default='00', verbose_name='Edición')
    revision = models.CharField(max_length=3, default='00', verbose_name='Revisión')
    file = models.FileField(verbose_name='Subir Archivo', upload_to=model_upload_image, null=True, blank=True)
    active = models.BooleanField(default=True, verbose_name='Activo')
    
    class Meta:
        ordering = ('order', )

    def __str__(self):
        return "{} {}".format(self.abbreviation, self.name)

    def file_exists(self):
        if self.file:
            return os.path.exists(self.file.path)
        return False


class Procedure(models.Model):
    process = models.ForeignKey(Process, on_delete=models.CASCADE, related_name='procedures', verbose_name='Proceso')
    name = models.CharField(max_length=150, unique=True, verbose_name='Nombre')
    abbreviation = models.CharField(max_length=15, verbose_name='Código')
    edition = models.CharField(max_length=3, default='00', verbose_name='Edición')
    revision = models.CharField(max_length=3, default='00', verbose_name='Revisión')
    file = models.FileField(verbose_name='Subir Archivo', upload_to=model_upload_image, null=True, blank=True)
    active = models.BooleanField(default=True, verbose_name='Activo')

    class Meta:
        ordering = ("process__order", "process__classifier__name", "name", "abbreviation", )

    def __str__(self):
        if hasattr(self.process, 'abbreviation'):
            process = self.process.abbreviation + "."
        else:
            process = ""
        return "{0}{1} {2}".format(process, self.abbreviation, self.name)

    @property
    def get_abbreviation(self):
        if hasattr(self.process, 'abbreviation'):
            process = self.process.abbreviation + "."
        else:
            process = ""
        return "{0}{1}".format(process, self.abbreviation)

    def file_exists(self):
        if self.file:
            return os.path.exists(self.file.path)
        return False
