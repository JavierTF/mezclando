import datetime
import os
import django
os.environ.setdefault('DJANGO_SETTING_MODULE','Tesis_Citmatel.settings')
django.setup()
from SISGDDO import models, views_sisgddo
ahora = datetime.date.today()
#try:
from django.core.management import call_command
from django.utils import timezone
call_command('makemigrations')
call_command('migrate')
licencias = models.tipo_de_licencias.objects.all()
proyectos = models.proyecto.objects.all()
acuerdos = models.acuerdos_consejillo.objects.all()
views_sisgddo.ControllerNotificaciones(licencias, proyectos, acuerdos, ahora)
#except Exception as a:
 #   try:
  #      pass
   # except Exception as e:
    #    pass
