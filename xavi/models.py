from django.db import models
from datetime import datetime
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.validators import FileExtensionValidator
from SISGDDO.storage import OverwriteStorage
from SISGDDO.validators import valid_extension
from apps.base.models import Employee, Process, Entity, Position
from django.forms import ValidationError

# Create your models here.
class prioridad(models.Model):
     nombre = models.CharField(max_length = 100, verbose_name = "nombre", unique = True)     
     activo = models.BooleanField(default = True, verbose_name = "activo*")

     def __str__(self):
         return str(self.nombre)
     
class tipo_extension(models.Model):
     nombre = models.CharField(max_length = 100, verbose_name = "nombre", unique = True)     
     activo = models.BooleanField(default = True, verbose_name = "activo*")

     def __str__(self):
         return str(self.nombre)
     
class etapa_proyecto(models.Model):
     nombre = models.CharField(max_length = 100, verbose_name = "nombre", unique = True)     
     activo = models.BooleanField(default = True, verbose_name = "activo*")

     def __str__(self):
         return str(self.nombre)
     
class estado_proyecto(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name='nombre*', unique = True)
    etapa = models.ForeignKey(etapa_proyecto, on_delete = models.CASCADE, verbose_name = 'Etapa de proyecto*', related_name='etapas')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)
     
class area(models.Model):
     nombre = models.CharField(max_length = 65, verbose_name = "nombre*", unique = True)
     centro_costo = models.CharField(max_length = 10, verbose_name = "centro de costo*")
     activo = models.BooleanField(default = True, verbose_name = "activo*")

     def __str__(self):
         return str(self.nombre)
     
class cliente(models.Model):
     codigo = models.CharField(max_length = 20, verbose_name = "nombre*", blank = True, null = True)
     nombre = models.CharField(max_length = 65, verbose_name = "nombre*")
     activo = models.BooleanField(default = True, verbose_name = "activo*")

     def __str__(self):
         return str(self.nombre)
     
class representante(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = "nombre*", unique = True)
    cliente = models.ForeignKey(cliente, on_delete = models.DO_NOTHING, verbose_name = 'cliente*')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.cliente.nombre) + " " + str(self.nombre)
    
class autor_sosi(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = "nombre*", unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

# moduloJavier
class linea_tematica(models.Model):
    nombre = models.CharField(max_length = 55, verbose_name = "nombre", unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)    
    
#moduloJavier
class estado_acuerdo(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*', null = True, unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

## moduloJavier
class acuerdo(models.Model):
    numero = models.CharField(max_length = 6, verbose_name = "Número de acuerdo*", unique = True, null = True)
    nombre = models.CharField(max_length = 125, verbose_name = 'Nombre del acuerdo*', null = True)
    fecha = models.DateField(verbose_name = 'fecha*')
    fecha_limite = models.DateField(verbose_name = 'fecha límite para cumplir', null = True, blank = False)
    fecha_cumplimiento = models.DateField(verbose_name = 'fecha de cumplimiento', null = True, blank = False)
    employee = models.ManyToManyField(Employee, verbose_name = 'responsable*')
    observaciones = models.TextField(verbose_name = 'observaciones', null = True, blank = False)
    estado = models.ForeignKey(estado_acuerdo, on_delete = models.DO_NOTHING, verbose_name = 'estado de acuerdo*', null = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.numero) + ' ' + str(self.nombre)

# moduloJavier
class estado_proyecto_dgca(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name='nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

# moduloJavier
class tipo_proyecto(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

# moduloJavier
# esta es la clasificacion
class clasificacion(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = 'nombre*', unique = True)
    siglas = models.CharField(max_length = 6, verbose_name = 'siglas*')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)
    
class subclasificacion(models.Model):
    siglas = models.CharField(max_length = 6, verbose_name = 'siglas*')
    nombre = models.CharField(max_length = 80, verbose_name='nombre*')
    clasificacion = models.ForeignKey(clasificacion, on_delete = models.CASCADE, verbose_name = 'clasificación*', related_name='subclasificacion')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

# moduloJavier
class fuente_financiamiento(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

# moduloJavier
class formato(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo")

    def __str__(self):
        return str(self.nombre)
    
# moduloJavier
class idioma(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo")

    def __str__(self):
        return str(self.nombre)
    
class tipo_moneda(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = 'nombre*', unique = True)
    siglas = models.CharField(max_length = 25, verbose_name = 'siglas*')
    activo = models.BooleanField(default = True, verbose_name = "activo")

    def __str__(self):
        return str(self.nombre)
    
class registro_reinicio(models.Model):
  fecha_inicio = models.DateField(verbose_name='fecha de inicio del reinicio', default = str(datetime.now))
  fecha_fin = models.DateField(verbose_name='fecha de fin del reinicio')
  activo = models.BooleanField(default=True, verbose_name="activo*")

  def __str__(self):
    return str(self.fecha_inicio) + " " + str(self.fecha_fin)

class registro_aprobacion(models.Model):
    cliente = models.ForeignKey(cliente, on_delete = models.DO_NOTHING, verbose_name = 'cliente*', null = True)
    contrato = models.CharField(max_length = 20, verbose_name = 'contrato*', null = True)
    centro_costo = models.ForeignKey(area, on_delete = models.DO_NOTHING, verbose_name = 'centro de costo*')
    employee = models.ManyToManyField(Employee, verbose_name = 'rol en el registro*', through = 'trabajador_registro')
    linea_tematica = models.ForeignKey(linea_tematica, verbose_name = 'línea temática', on_delete = models.DO_NOTHING, null = True, blank = True)
    fecha_inicio = models.DateField(default = datetime.now, verbose_name = "fecha de inicio*")
    fecha_terminacion = models.DateField(verbose_name = "fecha de fin", null = True, blank = True)
    financiamiento = models.ManyToManyField(fuente_financiamiento, verbose_name = 'financiamiento*', through = 'financiamiento_proyecto', blank = True, null = True)
    ingreso_mlc = models.CharField(max_length = 20, verbose_name = 'ingreso en mlc*', null = True, blank = True)
    ingreso_cup = models.CharField(max_length = 20, verbose_name = 'ingreso en cup*', null = True, blank = True)
    fecha_aprobacion = models.DateField(default = datetime.now, verbose_name = "fecha de aprobación Consejo Editorial", null = True, blank = True)
    registro_reinicio = models.OneToOneField(registro_reinicio, verbose_name = 'reinicio*', blank = True, null = True, on_delete = models.DO_NOTHING)
    aprobacion_consejo = models.CharField(max_length = 25, verbose_name = 'aprobación Consejo Editorial', null = True, blank = True)
    
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.proyecto.codigo) + " " + str(self.fecha_inicio)

# moduloJavier
class proyecto(models.Model):
    def ruta(self, filename):
        """
        It returns a string that is the path to the folder where the file will be saved
        consecutivos/DES8098/  ---> informe.pdf
        :return: The path to the file.
        """
        return '/'.join(['proyectos', f'/{self.codigo}/', filename])

    no = models.CharField(max_length = 10, verbose_name = "número*", null = True, blank = True)
    codigo = models.CharField(max_length = 10, verbose_name = 'código*', null = True)
    # nombre = models.CharField(max_length = 250, verbose_name = 'nombre*', null = True)
    nombre_proyecto = models.CharField(max_length = 250, verbose_name = 'nombre de proyecto*', null = True)
    registro_aprobacion = models.OneToOneField(registro_aprobacion, verbose_name = 'registro de aprobación*',
                        on_delete = models.DO_NOTHING, null = True, related_name = 'proyecto')
    
    subclasificacion = models.ForeignKey(subclasificacion, on_delete = models.DO_NOTHING, verbose_name = 'subclasificación*', related_name='proyectos')
    formato = models.ManyToManyField(formato, verbose_name = 'formato', related_name = 'proyecto')
    
    # control_calidad = models.ManyToManyField(Employee, verbose_name = 'control de calidad*', through = 'calidad_proyecto', related_name='calidad')
    # aceptacion_cliente = models.FileField(upload_to = ruta, verbose_name = 'aceptación del cliente', null = True, blank = True)
    # fecha_interrupcion = models.DateField(default = datetime.now, verbose_name = "fecha de interrupción", null = True, blank = True)
    # causa_interrupcion = models.CharField(max_length = 250, verbose_name = 'causa de la interrupción', null = True, blank = True)
    # propuso_interrupcion = models.ForeignKey(Employee, verbose_name = 'propuso interrupción*', on_delete = models.CASCADE, related_name='propuso_interrupcion')
    
    
    
    
    
    
    
    
    
    
    # tipo_codigo = models.ForeignKey(tipo_codigo, on_delete = models.SET('Tipo de código eliminado de la Base de datos'), verbose_name = 'tipo de código*', null = True)
    # fecha_entrada = models.DateField(default = datetime.now, verbose_name = "fecha de entrada*")
    # tipo = models.ForeignKey(tipo_proyecto, on_delete = models.DO_NOTHING, verbose_name = 'tipo de proyecto*', null = True)
    # area = models.ForeignKey(area, on_delete = models.DO_NOTHING, verbose_name = 'área*')
    # employee = models.ManyToManyField(Employee, verbose_name = 'rol en el proyecto*', through = 'trabajador_proyecto')
    # fuente_financiamiento = models.ForeignKey(fuente_financiamiento, on_delete = models.DO_NOTHING, verbose_name = 'fuente de financiamiento*', null = True)
    # aprobacion_consejo = models.CharField(max_length = 25, verbose_name = 'aprobación Consejo Editorial', null = True, blank = True)
    # fecha_aprobacion = models.DateField(default = datetime.now, verbose_name = "fecha de aprobación Consejo Editorial", null = True, blank = True)
    # fecha_inicio = models.DateField(default = datetime.now, verbose_name = "fecha de inicio*")
    
    # fecha_terminacion = models.DateField(verbose_name = "fecha de fin", null = True, blank = True)
    # fecha_extension = models.DateField(verbose_name = "fecha de extensión", null = True, blank = True)
    # fecha_cierre = models.DateField(verbose_name = "fecha de cierre", null = True, blank = True)
    # costo = models.IntegerField(default = 0, validators=[MinValueValidator(1000), MaxValueValidator(9999999)],
    #                         verbose_name = 'costo*')
    # observacion = models.CharField(max_length = 250, verbose_name = 'observacion', null = True, blank = True)
    # informe_apertura = models.FileField(upload_to = ruta, verbose_name = 'informe apertura', null = True, 
    #                     blank = True)
    # informe_cierre = models.FileField(upload_to = ruta, verbose_name = 'informe cierre', null = True, blank = True)
    # linea_tematica = models.ForeignKey(linea_tematica, verbose_name = 'línea temática',
    #                     on_delete = models.DO_NOTHING, null = True, blank = True)
    creado = models.DateField(default = datetime.now, verbose_name = "fecha de creado en base de datos*")
    estado = models.ForeignKey(estado_proyecto, on_delete = models.DO_NOTHING, verbose_name = 'estado*')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.codigo) + ' ' + str(self.nombre_proyecto)

    def __unicode__(self):
        return str(self.codigo) + ' ' + str(self.nombre_proyecto)
    
#modulo Javier
class sosi(models.Model):
    numero_salva = models.CharField(max_length = 10, verbose_name = "número*")
    fecha = models.DateField(default = datetime.now().strftime('%Y-%m-%d'), verbose_name = 'fecha de entrada*', null = True, blank = True)
    especialista = models.ForeignKey(Employee, on_delete = models.DO_NOTHING, verbose_name = 'trabajador que entrega*')
    recibe = models.ForeignKey(Employee, on_delete = models.DO_NOTHING, verbose_name = 'trabajador que recibe*', related_name = 'recibe')
    # autor = models.ForeignKey(area, on_delete = models.CASCADE, verbose_name = 'área o autor*')
    ubicacion_salva = models.CharField(max_length = 10, verbose_name = 'ubicación', null = True, blank = True)
    observaciones = models.CharField(max_length = 150, verbose_name = 'observaciones', null = True, blank = True)
    archivo = models.CharField(max_length = 150, verbose_name = 'ruta del archivo', null = True, blank = True)
    proyecto = models.OneToOneField(proyecto, verbose_name = 'proyecto*',
                        on_delete = models.CASCADE, null = True, related_name = 'sosi')
    idioma = models.ManyToManyField(idioma, verbose_name = 'Idioma*', blank = True)
    colectivo = models.BooleanField(default = False, verbose_name = "colectivo de autores")
    autor = models.ManyToManyField(autor_sosi, verbose_name = 'autor', null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.numero_salva) + ' ' + str(self.proyecto.nombre_proyecto)
    
class registro_terminacion(models.Model):
    # control_calidad
    recomendaciones = models.CharField(max_length=250, verbose_name='recomendaciones control de calidad', null=True, blank=True)
    revisado_por = models.ForeignKey(Employee, verbose_name='revisado por*', on_delete=models.DO_NOTHING, related_name='registro_terminacion_revisado', null=True, blank=True)
    fecha_revision = models.DateField(verbose_name="fecha de revisión*", default=datetime.now)
    verificado_por = models.ForeignKey(Employee, verbose_name='verificado por*', on_delete=models.DO_NOTHING, related_name='registro_terminacion_verificado', null=True, blank=True)
    fecha_verificacion = models.DateField(verbose_name="fecha de verificación*", default=datetime.now)
    # informe_financiero
    financiamiento = models.ManyToManyField(fuente_financiamiento, verbose_name='financiamiento*', through='financiamiento_proyecto', blank=True)
    ingreso_mlc = models.CharField(max_length=20, verbose_name='ingreso en mlc*', null=True, blank=True)
    ingreso_cup = models.CharField(max_length=20, verbose_name='ingreso en cup*', null=True, blank=True)
    # aceptacion_cliente
    aprobado_por = models.ForeignKey(cliente, verbose_name='verificado por*', on_delete=models.DO_NOTHING, related_name='registro_terminacion_cliente', null=True, blank=True)
    # ficha_tecnica
    no_ficha_tecnica = models.CharField(max_length=5, verbose_name='número ficha técnica', null=True, blank=True)
    recibido_por_ficha_tecnica = models.ForeignKey(Employee, verbose_name='recibido por (ficha técnica)*', on_delete=models.DO_NOTHING, related_name='registro_terminacion_recibido_ficha_tecnica', null=True, blank=True)
    fecha_ficha_tecnica = models.DateField(verbose_name="fecha de ficha técnica*", default=datetime.now)
    # sosi
    no_sosi = models.OneToOneField(sosi, verbose_name = 'sosi*',
                        on_delete = models.DO_NOTHING, null = True, related_name = 'registro_terminacion')
    # no_sosi = models.CharField(max_length=5, verbose_name='número sosi', null=True, blank=True)
    recibida_por_sosi = models.ForeignKey(Employee, verbose_name='recibida por (sosi)*', on_delete=models.DO_NOTHING, related_name='registro_terminacion_recibida_sosi', null=True, blank=True)
    fecha_sosi = models.DateField(verbose_name="fecha de sosi*", default=datetime.now)
    
    proyecto = models.OneToOneField(proyecto, verbose_name = 'registro de terminación*',
                        on_delete = models.DO_NOTHING, null = True, related_name = 'proyecto_registro_terminacion')

    activo = models.BooleanField(default=True, verbose_name="activo*")

    def __str__(self):
        return str(self.fecha_revision)

class registro_interrupcion(models.Model):
    fecha = models.DateField(verbose_name="fecha de interrupción*", default=datetime.now)
    motivo = models.CharField(max_length=250, verbose_name='motivo', null=True, blank=True)
    propuesto_por = models.ForeignKey(Employee, verbose_name='propuesto por*', on_delete=models.DO_NOTHING, null=True, blank=True)
    financiamiento = models.ManyToManyField(fuente_financiamiento, verbose_name='financiamiento*', through='financiamiento_proyecto', blank=True)
    # ingreso_mlc = models.CharField(max_length=10, verbose_name='ingreso en mlc*', null=True, blank=True)
    # ingreso_cup = models.CharField(max_length=10, verbose_name='ingreso en cup*', null=True, blank=True)
    aprobado_por = models.CharField(max_length=130, verbose_name='aprobado por', null=True, blank=True)
    
    proyecto = models.OneToOneField(proyecto, verbose_name = 'registro de interrupción*',
                        on_delete = models.DO_NOTHING, null = True, related_name = 'proyecto_registro_interrupcion')

    activo = models.BooleanField(default=True, verbose_name="activo*")

    def __str__(self):
        return str(self.fecha)

class tipo_extension(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)
    
class registro_extension(models.Model):
    centro_costo = models.ForeignKey(area, on_delete = models.DO_NOTHING, verbose_name = 'centro de costo*')
    jefe_proyecto = models.ForeignKey(Employee, verbose_name='jefe de proyecto*', on_delete=models.DO_NOTHING, null=True, blank=True)
    tipo_extension = models.ForeignKey(tipo_extension, verbose_name='tipo de extensión*', on_delete=models.DO_NOTHING, null=True, blank=True)
    observaciones = models.CharField(max_length=250, verbose_name='observaciones', null=True, blank=True)
    fecha_inicio = models.DateField(verbose_name="fecha de inicio*", default=datetime.now)
    fecha_fin = models.DateField(verbose_name="fecha de fin*", default=datetime.now)
    fecha_aprobacion = models.DateField(verbose_name="fecha de aprobación*", default=datetime.now)
    
    proyecto = models.OneToOneField(proyecto, verbose_name = 'registro de extensión*',
                        on_delete = models.DO_NOTHING, null = True, related_name = 'proyecto_registro_extension')

    activo = models.BooleanField(default=True, verbose_name="activo*")

    def __str__(self):
        return str(self.tipo_extension) + " " + str(self.fecha_aprobacion) 
    
class estado_software(models.Model):
     nombre = models.CharField(max_length = 100, verbose_name = "nombre", unique = True)     
     activo = models.BooleanField(default = True, verbose_name = "activo*")

     def __str__(self):
         return str(self.nombre)
     
class accion_control_etapa(models.Model):
     nombre = models.CharField(max_length = 100, verbose_name = "nombre", unique = True)     
     activo = models.BooleanField(default = True, verbose_name = "activo*")

     def __str__(self):
         return str(self.nombre)
    
class control_etapa(models.Model):
    employee = models.ManyToManyField(Employee, verbose_name = 'rol en el registro*', through = 'trabajador_etapa')
    
    proyecto = models.OneToOneField(proyecto, verbose_name = 'registro de extensión*',
                        on_delete = models.DO_NOTHING, null = True, related_name = 'proyecto_control_etapa')

    activo = models.BooleanField(default=True, verbose_name="activo*")

    def __str__(self):
        return str(self.proyecto)
    
class trabajador_etapa(models.Model):
    estado_software = models.ForeignKey(estado_software, verbose_name = 'estado de software*', on_delete = models.CASCADE)
    employee = models.ForeignKey(Employee, verbose_name = 'trabajador*', on_delete = models.CASCADE)
    registro = models.ForeignKey(control_etapa, verbose_name = 'control de etapa*', on_delete = models.CASCADE)
    accion_control_etapa = models.ForeignKey(accion_control_etapa, verbose_name = 'accion en el control de etapa*', on_delete = models.CASCADE)
    fecha = models.DateField(verbose_name="fecha de inicio*", default=datetime.now)
    # rol = models.ForeignKey(Position, verbose_name = 'rol*', on_delete = models.CASCADE, null = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.employee) + " " + str(self.registro)
    
class plan_ingreso_aprobacion(models.Model):
    fuente_financiamiento = models.ForeignKey(fuente_financiamiento, on_delete = models.CASCADE, verbose_name = 'fuente de financiamiento*', null = True)
    registro = models.ForeignKey(registro_aprobacion, verbose_name = 'registro de aprobación*', on_delete = models.CASCADE, null = True, blank = True)
    registro_terminacion = models.ForeignKey(registro_terminacion, verbose_name = 'registro de terminación*', on_delete = models.CASCADE, null = True, blank = True)
    tipo_moneda = models.ForeignKey(tipo_moneda, verbose_name = 'rol*', on_delete = models.CASCADE)
    valor = models.CharField(max_length = 15, verbose_name = 'valor financiamiento*', null = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.employee) + " " + str(self.registro) + " " + str(self.rol)
    
# class financiamiento_terminacion(models.Model):
#     # proyecto = models.ForeignKey(proyecto, on_delete = models.CASCADE, verbose_name = 'proyecto*')
#     fuente_financiamiento = models.ForeignKey(fuente_financiamiento, on_delete = models.CASCADE, verbose_name = 'fuente de financiamiento*')
#     registro = models.ForeignKey(registro_terminacion, verbose_name = 'registro de terminación*', on_delete = models.CASCADE)
#     tipo_moneda = models.ForeignKey(tipo_moneda, verbose_name = 'tipo de moneda*', on_delete = models.CASCADE, null = True)
#     valor = models.CharField(max_length = 15, verbose_name = 'valor financiamiento*')
#     activo = models.BooleanField(default = True, verbose_name = "activo*")

#     def __str__(self):
#         return str(self.fuente_financiamiento) + " " + str(self.tipo_moneda.nombre) + " " + str(self.valor) 

class financiamiento_proyecto(models.Model):
    # proyecto = models.ForeignKey(proyecto, on_delete = models.CASCADE, verbose_name = 'proyecto*')
    fuente_financiamiento = models.ForeignKey(fuente_financiamiento, on_delete = models.CASCADE, verbose_name = 'fuente de financiamiento*', null = True, blank = True)
    registro = models.ForeignKey(registro_aprobacion, verbose_name = 'registro de aprobación*', on_delete = models.CASCADE, null = True, blank = True)
    registro_terminacion = models.ForeignKey(registro_terminacion, verbose_name = 'registro de terminación*', on_delete = models.CASCADE, null = True, blank = True)
    registro_interrupcion = models.ForeignKey(registro_interrupcion, verbose_name = 'registro de interrupcion*', on_delete = models.CASCADE, null = True, blank = True)
    tipo_moneda = models.ForeignKey(tipo_moneda, verbose_name = 'tipo de moneda*', on_delete = models.CASCADE, null = True)
    valor = models.CharField(max_length = 20, verbose_name = 'valor financiamiento*', null = True, blank = True)
    valor_real = models.CharField(max_length = 20, verbose_name = 'valor real financiamiento*', null = True, blank = True)
    ingreso = models.CharField(max_length = 20, verbose_name = 'ingreso financiamiento*', null = True, blank = True)
    ingreso_real = models.CharField(max_length = 20, verbose_name = 'ingreso real financiamiento*', null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.fuente_financiamiento) + ", " + str(self.tipo_moneda.nombre) + ", " + str(self.valor)
    
class calidad_proyecto(models.Model):
    proyecto = models.ForeignKey(proyecto, on_delete = models.CASCADE, verbose_name = 'proyecto*')
    rol = models.ForeignKey(Employee, verbose_name = 'rol en control de calidad*', on_delete = models.CASCADE)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.employee) + " " + str(self.registro) + " " + str(self.rol)
    
# class consecutivo(models.Model):
#     nombre = models.CharField(max_length = 25, verbose_name = 'nombre*')
#     activo = models.BooleanField(default = True, verbose_name = "activo*")

#     def __str__(self):
#         return str(self.nombre)
    


class trabajador_consecutivo(models.Model):
    employee = models.ForeignKey(Employee, verbose_name = 'trabajador*', on_delete = models.DO_NOTHING)
    # consecutivo = models.ForeignKey(consecutivo, verbose_name = 'consecutivo*', on_delete = models.DO_NOTHING, null = True)
    rol = models.ForeignKey(Position, verbose_name = 'rol*', on_delete = models.DO_NOTHING)

    def __str__(self):
        return str(self.employee) + str(self.consecutivo) + str(self.rol)

#esta tabla es el rol del trabajador en el proyecto
class trabajador_proyecto(models.Model):
    employee = models.ForeignKey(Employee, verbose_name = 'trabajador*', on_delete = models.CASCADE)
    proyecto = models.ForeignKey(proyecto, verbose_name = 'proyecto*', on_delete = models.CASCADE)
    rol = models.ForeignKey(Position, verbose_name = 'rol*', on_delete = models.CASCADE)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.employee) + " " + str(self.proyecto) + " " + str(self.rol)
    
class trabajador_registro(models.Model):
    employee = models.ForeignKey(Employee, verbose_name = 'trabajador*', on_delete = models.CASCADE)
    registro = models.ForeignKey(registro_aprobacion, verbose_name = 'registro de aprobación*', on_delete = models.CASCADE)
    rol = models.ForeignKey(Position, verbose_name = 'rol*', on_delete = models.CASCADE, null = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.employee) + " " + str(self.registro) + " " + str(self.rol)

# moduloJavier
# class dato_adicional(proyecto):
#     fecha = models.DateField(verbose_name = 'Fecha del dato adicional*')
#     descripcion = models.TextField(max_length = 250, verbose_name = 'Descripcion del dato adicional')

#     def __str__(self):
#         return str(self.fecha + self.descripcion)

# # moduloJavier
# class conclusion_adicional(proyecto):
#     fecha = models.DateField(verbose_name = 'Fecha de la conclusión adicional*')
#     descripcion = models.TextField(max_length = 250, verbose_name = 'Descripcion de la conclusión adicional')

#     def __str__(self):
#         return str(self.fecha + self.descripcion)

# moduloJavier
class estado_entradas_proyecto(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)
    


# moduloJavier
class entrada_proyecto(models.Model):
    def ruta(self):
        """
        It returns a string that is the path to the folder where the file will be saved
        consecutivos/DES8098/  ---> informe.pdf
        :return: The path to the file.
        """
        return f'entradas_proyectos/{self.proyecto}/{self.fecha_entrada}/'

    no = models.CharField(max_length = 10, verbose_name = "número*", blank = True)
    fecha_entrada = models.DateField(default = datetime.now, verbose_name = "fecha*")
    fecha_salida = models.DateField(verbose_name = "Fecha de salida", null = True)
    entregado_por = models.ForeignKey(Employee, on_delete = models.CASCADE,
                                    verbose_name = "Trabajador que entrega", null = True)
    formato = models.ManyToManyField(formato, verbose_name = 'Formato*')
    proyecto = models.ForeignKey(proyecto, on_delete = models.CASCADE,
                                verbose_name = "Proyecto*", null = True, related_name = "entradas")
    dictamen = models.FileField(upload_to = "entradas_proyectos/", verbose_name = 'informe apertura', null = True, 
                        blank = True)
    # observaciones
    estado = models.ForeignKey(estado_proyecto_dgca, on_delete = models.SET_NULL,
                                verbose_name = "Estado entrada proyecto", null = True, related_name="entrada_proyecto")
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        # datetime.strptime(datetime.now().strftime('%Y-%m-%d'), "%Y-%m-%d")
        return str(self.no) + ' ' + str(self.fecha_entrada) + ' ' + str(self.proyecto)

# moduloJavier
class premio(models.Model):
    def ruta(self, filename):
        """
        It returns a string that is the path to the folder where the file will be saved
        consecutivos/DES8098/  ---> informe.pdf
        :return: The path to the file.
        """
        return '/'.join(['premios', f'/{self.nombre}/', filename]) 

    nombre = models.CharField(max_length = 150, verbose_name = "nombre*")
    descripcion=models.CharField(max_length=500,verbose_name='descripcion',null=True, blank=True)
    entidad = models.ForeignKey(Entity, on_delete = models.SET('CITMATEL'), verbose_name = 'entidad*')
    fecha = models.DateField(default = datetime.now, verbose_name = "fecha*")
    archivo = models.FileField(upload_to = ruta, verbose_name = 'planilla de la Reserva', null = True)
    activo = models.BooleanField(default = True, verbose_name = "activo")

    def __str__(self):
        return str(self.nombre)
   
#moduloJavier
#
# CAMBIAR EL NOMBRE OBJETIVO POR OBJETIVO_ESTRATEGICO
#
class objetivo(models.Model):
    no = models.CharField(max_length = 10, verbose_name = "número*", blank = True)
    nombre = models.CharField(max_length = 150, verbose_name = 'nombre*')
    fecha_definicion = models.DateField(verbose_name = 'fecha de definición*')    
    # evaluacion = models.CharField(max_length = 10, verbose_name = "evaluación*", null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        year = self.fecha_definicion.strftime("%Y")
        return f"{self.no} - {year} - {self.nombre}"
    
class evaluacion(models.Model):
    valor = models.CharField(max_length = 3, verbose_name = 'valor*', unique = True)
    nombre = models.CharField(max_length = 100, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)
    
class periodo(models.Model):
    nombre = models.CharField(max_length = 100, verbose_name = 'nombre*', unique = True)
    orden = models.CharField(max_length = 3, verbose_name = 'orden*', null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

class evaluacion_trimestral(models.Model):
    evaluacion = models.ForeignKey(evaluacion, on_delete = models.CASCADE, verbose_name = 'valor*', related_name = 'evaluacion_trimestral')
    periodo = models.ForeignKey(periodo, on_delete = models.CASCADE, verbose_name = 'periodo*', related_name = 'evaluacion_trimestral')
    objetivo = models.ForeignKey(objetivo, on_delete = models.CASCADE, verbose_name = 'objetivo*', related_name = 'evaluacion_trimestral')
    activo = models.BooleanField(default = True, verbose_name = "activo*")
    
    def __str__(self):
        return str(self.objetivo.nombre) + ' / Evaluación: ' + str(self.evaluacion.nombre) 
    
#moduloJavier
class estado_indicador_objetivos(models.Model):
    nombre = models.CharField(max_length = 20, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

#moduloJavier
class indicador_objetivos(models.Model):
    no = models.CharField(max_length = 10, verbose_name = "número*", unique = True, blank = True)
    nombre = models.CharField(max_length = 150, verbose_name = "nombre*", null = True, unique = True)
    # evaluacion = models.FloatField(verbose_name = 'evaluación*')
    objetivo = models.ForeignKey(objetivo, on_delete = models.CASCADE, verbose_name = 'objetivo', 
                                related_name = 'objetivos', null = True, blank = True)
    # estado = models.ForeignKey(estado_indicador_objetivos, on_delete = models.SET('Estado eliminado'), verbose_name = 'estado*', null = True)
    activo = models.BooleanField(default = True, verbose_name = "activo")
        
    def __str__(self):
        return str(self.nombre)
    
#moduloJavier
class accion_indicador_objetivo(models.Model):
    no = models.CharField(max_length = 10, verbose_name = "número*", null = True, blank = True)
    codigo = models.CharField(max_length = 10, verbose_name = "codigo*", null = True, blank = True)
    nombre = models.CharField(max_length = 150, verbose_name = "nombre*")
    indicador = models.ForeignKey(indicador_objetivos, on_delete = models.CASCADE, verbose_name = 'indicador*', null = True, blank = True, related_name = 'accion')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")
    # evaluacion = models.FloatField(verbose_name = 'evaluación*')

    # descripcion = models.ManyToManyField(area, verbose_name = 'descripcion*', through = 'descripcion')
    
    def __str__(self):
        return str(self.nombre)

class descripcion(models.Model):
    accion = models.ForeignKey(accion_indicador_objetivo, on_delete = models.CASCADE, verbose_name = 'acción*', related_name = 'descripcion')
    area = models.ForeignKey(area, on_delete = models.CASCADE, verbose_name = 'área*', related_name = 'descripcion')
    descripcion = models.CharField(max_length = 500, verbose_name = "descripcion*", null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")
    fecha_creacion = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    area_principal = models.BooleanField(default = False, verbose_name = "Área principal*")

    def __str__(self):
        return str(self.accion.nombre) + ' por ' + str(self.area.nombre)
    
    class Meta:
        unique_together = ('accion', 'area')