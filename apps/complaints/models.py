from django.db import models
from django.db.models.signals import pre_save
from django.dispatch import receiver

from apps.base.models import Client, Process
from apps.complaints.validators import DateInFutureValidator, validate_char
from apps.complaints.utils import set_complaints_number


COMPLAINT_STATUS = (
    (1, "EN PROCESO"),
    (2, "CERRADA"),
    (3, "NO PROCEDE"),
)


class WayOfReception(models.Model):
    name = models.CharField(max_length=150)

    def __str__(self):
        return self.name


class Complaint(models.Model):
    number = models.CharField(max_length=15, verbose_name='Registro', unique=True)
    created_date = models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creada')
    reception_date = models.DateField(verbose_name='Fecha de recepción', validators=[DateInFutureValidator()])
    deadline = models.DateField(verbose_name='Fecha de cierre', null=True, blank=True)
    client = models.CharField(max_length=255, verbose_name='Cliente', validators=[validate_char])
    process = models.ForeignKey(Process, verbose_name='Proceso', on_delete=models.CASCADE, related_name='complaints')
    way_of_reception = models.ForeignKey(WayOfReception, verbose_name='Vía de recepción', on_delete=models.CASCADE, related_name='complaints')
    reason = models.CharField(max_length=150, verbose_name='Motivo')
    status = models.PositiveIntegerField(verbose_name='Estado', choices=COMPLAINT_STATUS, default=1)

    @property
    def get_status(self):
        return COMPLAINT_STATUS[self.status - 1][1]


class ComplaintAction(models.Model):
    complaint = models.ForeignKey(Complaint, on_delete=models.CASCADE, related_name='actions')
    date = models.DateField(verbose_name='Fecha', validators=[DateInFutureValidator()])
    action = models.CharField(max_length=150, verbose_name='Acción')

    class Meta:
        ordering = ('-date', )
        unique_together = ('complaint', 'action', )

    def __str__(self):
        return self.action


# signals
@receiver(pre_save, sender=Complaint)
def preset_license(sender, **kwargs):
    if kwargs.get("instance"):
        instance = kwargs.get("instance")
        if not instance.number:
            set_complaints_number(instance=instance, sender=Complaint)
