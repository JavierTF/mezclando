from django.db import models
from django.db.models.signals import pre_save
from django.dispatch import receiver
import uuid

from apps.base.models import Entity, Employee, Process
from apps.licenses.validators import DateInPastValidator, DateInFutureValidator, validate_char
from apps.licenses.utils import set_license_number

LICENSE_STATUS = (
    (1, "ACTIVO"),
    (2, "EN PROCESO"),
    (3, "VENCIDO"),
)


def model_upload_image(instance, filename):
    ext = filename.split('.')[-1]
    return "images/{0}/{1}.{2}".format(instance._meta.model.__name__.lower(), uuid.uuid4(), ext)


class License(models.Model):
    number = models.CharField(max_length=15, verbose_name='Registro', unique=True)
    name = models.CharField(max_length=150, verbose_name='Nombre Documento', validators=[validate_char])
    entity = models.ForeignKey(Entity, verbose_name='Entidad que certifica', on_delete=models.CASCADE, related_name='licenses')
    created_date = models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creada')
    grant_date = models.DateField(verbose_name='Fecha de otorgamiento', validators=[DateInFutureValidator()])
    expiration_date = models.DateField(verbose_name='Fecha de vencimiento')
    process = models.ForeignKey(Process, verbose_name='Proceso', on_delete=models.CASCADE, related_name='licenses')
    responsible = models.ForeignKey(Employee, verbose_name='Responsable', on_delete=models.CASCADE, related_name='licenses')
    associated_process = models.ForeignKey(Process, verbose_name='Proceso asociado', on_delete=models.SET_NULL, null=True, blank=True, related_name='associated_processes')
    status = models.PositiveIntegerField(verbose_name='Estado', choices=LICENSE_STATUS, null=True, blank=True, default=1)
    observation = models.TextField(max_length=250, verbose_name='Observación', null=True, blank=True)
    file = models.FileField(verbose_name='Subir Documento', upload_to=model_upload_image, null=True, blank=True)
    active = models.BooleanField(default=True)

    class Meta:
        ordering = ('created_date', )

    def __str__(self):
        return "({number}) {name}".format(number=self.number, name=self.name)

    @property
    def get_status(self):
        return LICENSE_STATUS[self.status - 1][1]


# signals
@receiver(pre_save, sender=License)
def preset_license(sender, **kwargs):
    if kwargs.get("instance"):
        instance = kwargs.get("instance")
        if not instance.number:
            set_license_number(instance=instance, sender=License)
