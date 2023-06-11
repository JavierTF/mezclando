from django.db import models
from django.db.models.signals import pre_save
from django.dispatch import receiver
import uuid

from apps.base.models import Country
from apps.iproperty.validators import DateInFutureValidator
from apps.iproperty.utils import set_property_number

iPROPERTY_STATUS = (
    (1, "SOLICITADA"),
    (2, "CONDEDIDA"),
    (3, "DENEGADA"),
    (4, "VENCIDA"),
)

iPROPERTY_MODALITY = (
    (1, "MARCAS"),
    (2, "NOMBRES COMERCIALES"),
    (3, "EMBLEMA EMPRESARIAL"),
    (4, "RÓTULO DE ESTABLECIMIENTO"),
    (5, "PATENTE"),
    (6, "MODELO UTILIDAD"),
    (7, "MODELO INDUSTRIAL"),
)


def model_upload_image(instance, filename):
    ext = filename.split('.')[-1]
    return "images/{0}/{1}.{2}".format(instance._meta.model.__name__.lower(), uuid.uuid4(), ext)


class ProductClassification(models.Model):
    number = models.PositiveIntegerField(default=0, verbose_name='Código')
    name = models.CharField(max_length=150, verbose_name='Nombre')

    def __str__(self):
        return "{}".format(self.number)


class PatentClassification(models.Model):
    name = models.CharField(max_length=150, verbose_name='Nombre')

    def __str__(self):
        return self.name


class FigurativeElementClassification(models.Model):
    number = models.CharField(max_length=10, default='0.0.0', verbose_name='Código')
    name = models.CharField(max_length=150, verbose_name='Nombre')

    def __str__(self):
        return self.number


class DrawingClassification(models.Model):
    name = models.CharField(max_length=150, verbose_name='Nombre')

    def __str__(self):
        return self.name


class IndustrialProperty(models.Model):
    number = models.CharField(max_length=15, verbose_name='Registro', unique=True)
    name = models.CharField(max_length=150, verbose_name='Nombre', unique=True)
    created_date = models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creada')
    modality = models.PositiveIntegerField(verbose_name='Modalidad', choices=iPROPERTY_MODALITY)
    country = models.ForeignKey(Country, on_delete=models.CASCADE, verbose_name='País')
    application_date = models.DateField(verbose_name='Fecha de solicitud')
    application_number = models.CharField(max_length=10, verbose_name='Número de solicitud')
    status = models.PositiveIntegerField(verbose_name='Estado', choices=iPROPERTY_STATUS, default=1)
    certificate_number = models.CharField(max_length=10, verbose_name='Número de certificado')
    type_legal_document = models.CharField(max_length=150, verbose_name='Tipo de documento legal', null=True, blank=True)
    grant_date = models.DateField(verbose_name='Fecha de otorgamiento', validators=[DateInFutureValidator()], null=True, blank=True)
    expiration_date = models.DateField(verbose_name='Fecha de vencimiento', null=True, blank=True)
    granted_resolution = models.CharField(max_length=15, verbose_name='Concedido por resolución', null=True, blank=True)
    observation = models.TextField(max_length=500, verbose_name='Observación', null=True, blank=True)
    products = models.ManyToManyField(ProductClassification, verbose_name='Clasificación productos y servicios')
    patents = models.ManyToManyField(PatentClassification, verbose_name='Clasificación internacional de patentes')
    figurative_elements = models.ManyToManyField(FigurativeElementClassification, verbose_name='Clasificación internacional de elementos figurativos')
    drawings = models.ManyToManyField(DrawingClassification, verbose_name='Clasificación dibujo y modelos industriales')
    file = models.FileField(verbose_name='Subir Archivo', upload_to=model_upload_image, null=True, blank=True)

    def __str__(self):
        return self.name

    @property
    def get_modality(self):
        return iPROPERTY_MODALITY[self.modality - 1][1]

    @property
    def get_status(self):
        return iPROPERTY_STATUS[self.status - 1][1]


# signals
@receiver(pre_save, sender=IndustrialProperty)
def preset_property(sender, **kwargs):
    if kwargs.get("instance"):
        instance = kwargs.get("instance")
        if not instance.number:
            set_property_number(instance=instance, sender=IndustrialProperty)
