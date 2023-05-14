from SISGDDO import models
import os
from Tesis_Citmatel import settings
import django

settings.configure()
django.setup()

def importar_coleccion():
    CSVfile = open(os.path.join(settings.BASE_DIR, 'media/importarCSV/SOSI.csv'), mode='r', encoding='utf-8')
    pos = 0
    for fila in CSVfile:
        if pos >= 2:
            linea = fila.split('|')
            for i in linea[9].split('/'):
                if models.coleccion.objects.filter(nombre_Coleccion__icontains=i).count() > 0:
                    continue
                else:
                    new_coleccion= models.coleccion()
                    new_coleccion.nombre_Coleccion=i
                    new_coleccion.save()
importar_coleccion()