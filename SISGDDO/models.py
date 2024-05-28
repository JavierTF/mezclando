"""Cargando modelos"""
# from subprocess import REALTIME_PRIORITY_CLASS
from django.db import models
from datetime import datetime
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.validators import FileExtensionValidator
from SISGDDO.storage import OverwriteStorage
from SISGDDO.validators import valid_extension
from apps.base.models import Employee, Process, Entity, Position
from django.forms import ValidationError
from xavi.models import formato, area

class permisos_personalizados(models.Model):
    class Meta:
        permissions = [
            ('grafico_RH','Ver grafico de RRHH'),
            ('grafico_Cap','Ver grafico de CAP'),
            ('grafico_CA','Ver grafico de C y A'),
            ('grafico_D','Ver grafico de Direccion'),
            ('grafico_I','Ver grafico de Inform'),
            ('grafico_Admin','Ver grafico de Admin'),
        ]

class CambiarLogotipo(models.Model):
    fecha_cambio = models.DateField(default=datetime.now().strftime('%Y-%m-%d'),verbose_name="Fecha de Cambio del Logotipo")
    logo = models.ImageField(upload_to='logo/', storage=OverwriteStorage(),verbose_name='Logo*')

    def __str__(self):
        return str(self.fecha_cambio.__str__())
    

# moduloHermes  
    
class Contacto(models.Model):
        id=models.AutoField(primary_key=True,verbose_name='No.' ) 
        nombre=models.CharField(max_length=80,verbose_name='Nombre de Contacto')
        relacionados = models.ManyToManyField(
        Employee,
        verbose_name=('Trabajadores de contacto'),
        blank=True,
    )
        activo=models.BooleanField(auto_created=True, verbose_name='Activo',default=True)
        def __str__(self):
            return str(self.nombre) 
        

class ActividadPlan(models.Model):   
        id=models.AutoField(primary_key=True,verbose_name='No.')
        descripcion=models.CharField(max_length=80,verbose_name='Descripcion',null=True)
        dia=models.DateField(verbose_name='Día de la actividad')
        plan=models.CharField(max_length=80,verbose_name='Plan al que pertenece', default='')
        hora=models.TimeField(verbose_name='Hora de la Actividad')
        lugar=models.CharField(max_length=80,verbose_name='Lugar Previsto',null=True)
        otro=models.CharField(max_length=80,verbose_name='Otro Lugar',default='', blank=True)
        contcheck=models.BooleanField(verbose_name='Usar contactos',default=False,blank=True,null=True)
        contacto=models.ManyToManyField(
        Contacto,
        verbose_name=("Grupo de Contacto"),
        blank=True,
        related_name="contactos"
    )   
        estado_choices_crear = [
             ("Salon de Protocolo 5to piso", "Salon de Protocolo 5to piso"),
             ("Salon de reuniones 4to piso", "Salon de reuniones 4to piso"),
             ("Salon de reuniones Mirador", "Salon de reuniones Mirador"),
             ("Otros", "Otros"),
        ]
        preside=models.ManyToManyField(
        Employee,
        verbose_name=("Trabajadores que presiden"),
        blank=True,
        related_name="presiden"
    )       
        participantes = models.ManyToManyField(
        Employee,
        verbose_name=("Trabajadores que participan"),
        blank=True,
        related_name="participantes"
    )       
        activo=models.BooleanField(auto_created=True,verbose_name='Activo',default=True)
class PlanTrabajo(models.Model):
        numero=models.AutoField(primary_key=True,verbose_name='No.')
        nivel=models.CharField(max_length=80,verbose_name='Nivel Organizacional')
        activo=models.BooleanField(auto_created=True,verbose_name='Activo',default=True)
        def __str__(self):
            return str(self.numero)      


#Modulo Afectaciones
class Afectaciones(models.Model):
        numero=models.AutoField(primary_key=True,verbose_name='No.')
        fecha_recepcion=models.DateTimeField(verbose_name='Fecha de recepción')
        fecha_cierre = models.DateField(verbose_name = 'Fecha de cierre', null = True, blank = True)
        formato = models.ForeignKey(formato, verbose_name = 'formato', on_delete = models.SET('Formato eliminado de la Base de datos'), related_name = 'formatos_afectacion',blank = True, null=True)
        afectacion=models.CharField(max_length=80,verbose_name='Afectación reportada')
        propuesto=models.ForeignKey(area, on_delete = models.SET('Departamento eliminado de la Base de datos'),
                                   related_name = 'propuesto', verbose_name = 'Solicitado por',
                                   null = True)
        responsable=models.ForeignKey(area, on_delete = models.SET('Departamento eliminado de la Base de datos'),
                                   related_name = 'responsable', verbose_name = 'Ejecutor',
                                   null = True) 
        observacionesactual=models.CharField(max_length=250,verbose_name='Seguimiento',default='',blank=True)
        observacion=models.CharField(max_length=250,verbose_name='Seguimiento agregado',default='',blank=True)
        estado=models.CharField(max_length=50,verbose_name='Estado')
        activo=models.BooleanField(auto_created=True,verbose_name='Activo',default=True)
        
        estado_choices_modificar = [
             ("En proceso", "En proceso"),
             ("Cerrado", "Cerrado"),
        ]
       
      
       
        
        
# Modulo Auditoria Interna Hermes
class auditoria_interna(models.Model):
    id=models.AutoField(primary_key=True,verbose_name='No.')
    fechainicio = models.DateField(verbose_name = 'Fecha de inicio de auditoría', null = True)
    fechafin = models.DateField(verbose_name = 'Fecha de fin de auditoría', null = True)
    titulo = models.CharField(max_length = 150, verbose_name = 'Título del documento', null = True)
    proceso = models.ForeignKey(Process, on_delete = models.SET('Proceso eliminado'), verbose_name = 'Proceso que se audita', null = True)
    equipo = models.ManyToManyField(
        Employee,
        verbose_name=('Equipo auditor'),
        blank=True,
    )
    resultados = models.CharField(max_length = 150, verbose_name = 'Resultado',blank= True, null = True)
    objetivos = models.CharField(max_length = 250, verbose_name = 'Objetivos de la auditoría',blank= True, null = True)
    alcance = models.CharField(max_length = 250, verbose_name = 'Alcance de la auditoría',blank= True, null = True)
    criterios = models.CharField(max_length = 250, verbose_name = 'Criterios de la auditoría',blank= True, null = True)
    observaciones = models.CharField(max_length = 250, verbose_name = 'Observaciones de la auditoría',blank= True, null = True)
    informe = models.FileField(upload_to = 'dictamenes/', verbose_name = 'Informe de la auditoria(PDF o Imágen)',blank= True, null = True,validators=[valid_extension])
    activo = models.BooleanField(default = True, verbose_name = "Activo")
    resultados_choices_crear = [
            ("Conforme","Conforme"),
            ("Aceptable","Aceptable"),
            ("Satifactoria", "Satifactoria"),
             ("Deficiente", "Deficiente"),
        ]
    
# Modulo Auditoria Externa Hermes
class auditoria_externa(models.Model):
    id=models.AutoField(primary_key=True,verbose_name='No.')
    def number():
        no = auditoria_externa.objects.count()
        if no == None:
            return 1
        else:
            return no + 1
    fechainicio = models.DateField(verbose_name = "Fecha de inicio de auditoría", null = True)
    fechafin = models.DateField(verbose_name = 'Fecha de fin de auditoría', null = True)
    registro = models.IntegerField( verbose_name='Número de Registro',default=number)
    titulo = models.CharField(max_length = 150, verbose_name = 'Título del documento', null = True)
    entidad = models.ForeignKey(Entity, on_delete = models.SET('Entidad eliminada'), verbose_name = 'Entidad',null=True)
    proceso = models.ManyToManyField(
        Process,
        verbose_name=("Procesos que se auditan"),
        blank=True,
    )
    resultados = models.CharField(max_length = 150, verbose_name = 'Resultado', null = True)
    observaciones = models.CharField(max_length = 250, verbose_name = 'Observaciones', null = True, blank = True)
    informe = models.FileField(upload_to = 'dictamenes/', verbose_name = 'Informe de la auditoría (PDF o Imagen)',blank= True, null = True,validators=[valid_extension])
    plan_medidas = models.FileField(upload_to = 'dictamenes/', verbose_name = 'Plan de medidas (PDF o Imagen)',blank= True, null = True,validators=[valid_extension])
    activo = models.BooleanField(default = True, verbose_name = "Activo")

    resultados_choices_crear = [
            ("Conforme","Conforme"),
            ("Aceptable","Aceptable"),
            ("Satifactorio", "Satifactorio"),
             ("Deficiente", "Deficiente"),
        ]
    

    def __str__(self):
        return str(self.titulo)

# Modulo Incidencias Hermes
class incidencia(models.Model):
    id=models.AutoField(primary_key=True,verbose_name='No.')
    titulo=models.CharField(max_length = 250, verbose_name = 'Asunto')
    fecha_recepcion = models.DateField(verbose_name = 'Fecha de recepción')
    fecha_cierre = models.DateField(verbose_name = 'Fecha de cierre', null = True, blank = True)
    hora=models.TimeField(verbose_name='Hora de recepción',default='00:00')
    descripcion = models.CharField(max_length = 250, verbose_name = 'Comentarios')
    trabajador = models.ForeignKey(Employee,null = True, verbose_name='Reportado por',
                                 on_delete=models.SET('Trabajador eliminado'))
    proceso = models.ForeignKey(Process,null = True, verbose_name='Proceso asociado',blank=True,
                                 on_delete=models.SET('Area eliminada'))
    ejecutante = models.ForeignKey(area, verbose_name='Ejecutor', related_name='ejecutante',blank=True,null = True,
                                on_delete=models.SET('Area eliminada'), db_column = 'ejecutante_id')
    respuesta = models.TextField(max_length = 250, verbose_name = 'Seguimiento', null = True)
    estado = models.CharField(max_length = 250, null=True, verbose_name = 'Estado')
    activo = models.BooleanField(default = True, verbose_name = "Activo")
    estado_choices_modificar = [
             ("En proceso", "En proceso"),
             ("Cumplido", "Cumplido"),
        ]
    
    def __str__(self):
        return str(self.titulo)
