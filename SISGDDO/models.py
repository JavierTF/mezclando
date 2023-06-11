"""Cargando modelos"""
# from subprocess import REALTIME_PRIORITY_CLASS
from django.db import models
from datetime import datetime
from django.core.validators import MaxValueValidator, MinValueValidator
from SISGDDO.storage import OverwriteStorage

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

#moduloGeneral
class trabajador(models.Model):
    nombre = models.CharField(max_length= 25,verbose_name='Nombre del Trabajador*')
    primer_apellido = models.CharField(max_length= 25, verbose_name='Primer Apellido*')
    segundo_apellido = models.CharField(max_length= 25, verbose_name='Segundo Apellido*')
    ci = models.CharField(max_length=11,verbose_name='Carnet de Identidad*',default=1999,null=True,blank=True)
    cargo = models.CharField(max_length= 60,verbose_name='Cargo*')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre + ' ' + self.primer_apellido + ' ' + self.segundo_apellido)

    def __unicode__(self):
        return str(self.nombre + ' ' + self.primer_apellido + ' ' + self.segundo_apellido)

# moduloJavier
class proceso(models.Model):
    nombre = models.CharField(max_length = 60, verbose_name = 'Nombre del proceso*', unique = True, null = True)
    abreviatura = models.CharField(max_length = 3, verbose_name = 'Abreviatura*')
    responsable = models.ManyToManyField(trabajador, verbose_name = 'Responsable*')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

# moduloHermes
class PlanesdeTrabajo(models.Model):
        numero=models.PositiveIntegerField(primary_key=True,verbose_name='No.*')
        descripcion=models.CharField(max_length=80,verbose_name='Descripcion*')
        fecha=models.DateTimeField(blank=True,verbose_name='Fecha de Reunion*')
        hora=models.TimeField(blank=True,verbose_name='Hora Programada*')
        lugar=models.CharField(max_length=80,verbose_name='Lugar Previsto*')
       ## preside=models.ForeignKey(trabajador, on_delete = models.SET('Trabajador eliminado de la Base de datos'),
       ##                     null = True)
       ## participantes=models.ManyToManyField(trabajador, on_delete = models.SET('Trabajador eliminado de la Base de datos'),
       ##                            related_name = 'participantes', verbose_name = "Trabajadores que Paticipan*",
       ##                            null = True)
        def __str__(self):
            return str(self.numero)
                                
        #Modulo Afectaciones
class Afectaciones(models.Model):
        numero=models.PositiveIntegerField(primary_key=True,verbose_name='No.*')
        fecha_recepcion=models.DateTimeField(blank=True,verbose_name='Fecha de Entrada*')
        afectacion=models.CharField(max_length=80,verbose_name='Afectacion reportada*')
        propuesto=models.ForeignKey(trabajador, on_delete = models.SET('Trabajador eliminado de la Base de datos'),
                                   related_name = 'propuesto', verbose_name = "Promotor de Afeccion*",
                                   null = True)
        responsable=models.ForeignKey(trabajador, on_delete = models.SET('Trabajador eliminado de la Base de datos'),
                                   related_name = 'responsable', verbose_name = "Responsable de Afeccion*",
                                   null = True)
        mesplaneado=models.DateField(blank=True,verbose_name='Mes Planeado Resolverse*')
        fechacierre=models.DateTimeField(blank=True,verbose_name='Fecha de cierre*')
        observacionesactual=models.CharField(max_length=250,verbose_name='Observaciones*')
        observacionesfutura=models.CharField(max_length=250,verbose_name='Observaciones*')
        estado=models.CharField(max_length=50,verbose_name='Estado*')
        def __str__(self):
            texto= "{0}({1})"
            return texto.format(self.numero,self.solucion)
        # Modulo Auditoria Interna Hermes
class auditoria_interna(models.Model):
    fecha = models.DateField(verbose_name = 'Fecha de auditoría*')
    titulo = models.CharField(max_length = 150, verbose_name = 'Título del informe*', null = True)
    ##proceso = models.ForeignKey(proceso, on_delete = models.SET('Proceso eliminado'), verbose_name = 'Proceso*', null = True)
    ##responsable = models.ManyToManyField(trabajador, verbose_name = 'Responsable*')
    objetivos = models.CharField(max_length = 250, verbose_name = 'Objetivos de la auditoría', null = True, blank = True)
    alcance = models.CharField(max_length = 250, verbose_name = 'Alcance de la auditoría', null = True, blank = True)
    criterios = models.CharField(max_length = 250, verbose_name = 'Criterios de la auditoría', null = True, blank = True)
    observaciones = models.CharField(max_length = 250, verbose_name = 'Observaciones de la auditoría', null = True, blank = True)
    ##informe = models.FileField(upload_to = 'dictamenes/', verbose_name = 'Informe de la auditoria*', null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo")
        # Modulo Incidencias Hermes
class incidencia(models.Model):
    fecha_recepcion = models.DateField(verbose_name = 'Fecha de recepcion de la incidencia*')
    fecha_cierre = models.DateField(verbose_name = 'Fecha de cierre de la incidencia', null = True, blank = True)
    descripcion = models.CharField(max_length = 250, verbose_name = 'Descripción de la incidencia*')
    trabajador = models.ForeignKey(trabajador,null = True, verbose_name='Trabajador que reporta la incidencia*',
                                 on_delete=models.SET('Trabajador eliminado'))

    ##proceso = models.ForeignKey(proceso, on_delete = models.SET('Proceso eliminado'), verbose_name = 'Proceso que da respuesta a la incidencia', 
    ##        null = True, blank = True)
    ##trabajador = models.ManyToManyField(trabajador, verbose_name = 'Trabajador o ejecutante*', through = 'trabajador_incidencia')
    ##ejecutante = models.ForeignKey(trabajador, verbose_name='Trabajador que responde a la incidencia',
    ##                            on_delete=models.SET('Trabajador eliminado'), db_column = 'ejecutante_id')
    respuesta = models.TextField(max_length = 250, verbose_name = 'Respuesta dada a la incidencia', null = True, blank = True)
    ##estado = models.ForeignKey(estado_incidencia, on_delete = models.SET('Estado eliminado'), verbose_name = 'Estado de la incidencia')
    activo = models.BooleanField(default = True, verbose_name = "Activo")
    
    def __str__(self):
        return str(self.descripcion)

    def __str__(self):
        return str(self.titulo)
# moduloAbel
class indicador(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = "Nombre del indicador*", unique = True)
    evaluacion = models.FloatField(verbose_name = 'Evaluación del indicador*')
    proceso = models.ForeignKey(proceso, on_delete = models.CASCADE, verbose_name = 'Proceso*', null = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo")
    
    def __str__(self):
        return str(self.nombre)
        
#moduloAbel
class aspecto_medir_eficacia_indicador(models.Model):
    nombre = models.CharField(max_length = 150, verbose_name = 'Nombre de aspecto*')
    calificacion = models.IntegerField(verbose_name = 'Calificación de aspecto*', null = True)
    indicador = models.ForeignKey(indicador, on_delete = models.CASCADE, verbose_name = 'Indicador*')
    activo = models.BooleanField(default = True, verbose_name = "Activo")

    def __str__(self):
        return str(self.nombre)

# moduloJavier
class procedimiento(models.Model):
    codigo = models.CharField(max_length = 10, verbose_name = 'Código del procedimiento*', unique = True, null = True)
    nombre = models.CharField(max_length = 60, verbose_name = 'Nombre del procedimiento*')
    proceso = models.ForeignKey(proceso, on_delete = models.CASCADE, verbose_name = 'Proceso')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

# moduloAbel
class eficacia(models.Model):
    anno = models.DateField(default = datetime.now().strftime('%Y-%m-%d'), verbose_name='Año análisis de eficacia*')
    semestre = models.BooleanField(default = False, verbose_name = 'Semestre*', 
                                help_text = 'Si es False es el primer semestre si no es el segundo semestre')
    
    evaluado_por = models.ForeignKey(trabajador, on_delete = models.SET('Trabajador eliminado de la Base de datos'),
                                    related_name = 'evaluado_por_eficacia', verbose_name = "Evaluado por*",
                                    null = True)
    indicador = models.ManyToManyField(indicador, verbose_name = 'Indicador')
    eficaz = models.BooleanField(default = False, verbose_name = 'Eficaz*')
    responsable = models.ForeignKey(trabajador, on_delete = models.SET('Trabajador eliminado de la Base de datos'),
                                    related_name = 'responsable_eficacia', verbose_name = "Responsable*",
                                    null = True)
    proceso_asociado = models.ForeignKey(proceso, on_delete = models.SET_NULL, related_name = 'procesos_asociados',
                                    verbose_name = 'Proceso asociado*', null = True)
    activo = models.BooleanField(default=True, verbose_name="Activo")

    def __str__(self):
        return self.proceso.nombre + self.proceso_asociado

    def eval_total(self):
        sum = 0
        for ind in self.proceso_ef.indicador_eficacia_set.all():
            sum += indic.calif_ind
        return round(sum / self.proceso.indicador_eficacia_set.count(), 2)

    def Eficaz(self):
        if self.proceso.abreviatura == 'P00' or self.proceso.abreviatura == 'P01' or self.proceso.abreviatura == 'P05' or  self.proceso.abreviatura == 'P08' or self.proceso.abreviatura == 'P11' or self.proceso.abreviatura == 'P15':
            if self.eval_tot >= 4:
                return True
            else:
                return False
        elif self.proceso.abreviatura == 'P04' or self.proceso.abreviatura == 'P06' or self.proceso.abreviatura == 'P07' or self.proceso.abreviatura == 'P09' or self.proceso.abreviatura == 'P12' or self.proceso.abreviatura == 'P14':
            if self.eval_tot >= 3.5:
                return True
            else:
                return False
        elif self.proceso.abreviatura == 'P10' or self.proceso.abreviatura == 'P13' or self.proceso.abreviatura == 'P03':
            if self.eval_tot >= 3:
                return True
            else:
                return False

# moduloJavier
class area(models.Model):
     nombre = models.CharField(max_length = 65, verbose_name = "nombre", null = True, unique = True)
     activo = models.BooleanField(default = True, verbose_name = "activo*")

     def __str__(self):
         return str(self.nombre)

#moduloAbel
class pais(models.Model):
     nombre = models.CharField(max_length = 65, verbose_name = "Nombre del país", null = True, unique = True)
     activo = models.BooleanField(default = True, verbose_name = "Activo*")

     def __str__(self):
         return str(self.nombre)

# moduloJavier
class linea_tematica(models.Model):
    nombre = models.CharField(max_length = 55, verbose_name = "nombre", unique = True)
    anno = models.CharField(verbose_name = "año", max_length = 4, null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)    

class estado_licencia(models.Model):
    nombre = models.CharField(max_length = 20, verbose_name = 'Nombre de estado*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

#moduloErik
class cliente(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name = 'Nombre y apellidos*')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

#Nomenclador CENDA tipo de obra Dayana#######################
class tipo_de_obra (models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo")

    def __str__(self):
        return str(self.nombre)

class estado_cenda (models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo")

    def __str__(self):
        return str(self.nombre)
######################################################

#moduloAbel
class accion(models.Model):
    tratamiento = models.CharField(max_length=60,verbose_name='Tratamiento*')
    fecha_cumplir = models.DateField(default = datetime.now,verbose_name='Fecha a Cumplir*')
    seguimiento = models.CharField(max_length=60,verbose_name='Seguimiento*')
    responsable = models.ManyToManyField(trabajador, verbose_name='Responsble*')
    activo = models.BooleanField(default=True, verbose_name="Activo")

    def __str__(self):
        return str(self.tratamiento)

#moduloAbel
class plan_medidas(models.Model):
    actividad = models.CharField(max_length= 50,verbose_name='Actividad*')
    titulo_doc = models.CharField(max_length= 80,verbose_name='Título del Documento*')
    fecha = models.DateField(verbose_name='Fecha*')
    proceso = models.ForeignKey(proceso,on_delete=models.CASCADE,verbose_name='Proceso*')
    acciones = models.ManyToManyField(accion,verbose_name='Acciones*')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.titulo_doc)

#moduloJavier
class estado_acuerdo(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*', null = True, unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

# moduloJavier
class acuerdo(models.Model):
    numero = models.CharField(max_length = 6, verbose_name = "Número de acuerdo*", unique = True, null = True)
    numero = models.CharField(max_length = 6, verbose_name = "Número de acuerdo*", unique = True, null = True)
    nombre = models.CharField(max_length = 25, verbose_name = 'Nombre del acuerdo*', null = True)
    fecha = models.DateField(verbose_name = 'Fecha de tomado el acuerdo*', 
                            help_text = 'Día/Mes/Año ejemplo 01/01/2020')
    fecha_limite = models.DateField(verbose_name = 'Fecha límite para cumplir', 
                            help_text = 'Día/Mes/Año ejemplo 01/01/2020')
    fecha_cumplimiento = models.DateField(verbose_name = 'Fecha de cumplido el acuerdo', 
                            help_text = 'Día/Mes/Año ejemplo 01/01/2020')
    responsable = models.ManyToManyField(trabajador, verbose_name = 'Responsable*')
    observaciones = models.TextField(verbose_name = 'Observaciones sobre el acuerdo*', null = True)
    estado_acuerdo = models.ForeignKey(estado_acuerdo, on_delete = models.SET('Estado eliminado'), 
                                verbose_name = 'Estado de acuerdo*')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.numero + self.nombre)

# Nomenclador para Incidencias Erik
class estado_incidencia(models.Model):
    estado = models.CharField(max_length = 25,verbose_name = 'Estado de la incidencia')
    activo = models.BooleanField(default = True, verbose_name = "Activo")

    def __str__(self):
        return str(self.estado)


#esta tabla es el rol del trabajador en el proyecto
# class trabajador_incidencia(models.Model):
#     trabajador = models.ForeignKey(trabajador, verbose_name = 'Trabajador*', on_delete = models.CASCADE)
#     incidencia = models.ForeignKey(incidencia, verbose_name = 'Incidencia*', on_delete = models.CASCADE) 
#     ejecutante = models.BooleanField(default = False, verbose_name = 'Si es False es Trabajador, si es True es Ejecutante*')

#     def __str__(self):
#         return str(self.nombre)

# moduloJavier
class estado_proyecto(models.Model):
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
class tipo_codigo(models.Model):
    nombre = models.CharField(max_length = 30, verbose_name = 'nombre*', unique = True)
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
class consecutivo(models.Model):
    def ruta(self):
        """
        It returns a string that is the path to the folder where the file will be saved
        consecutivos/DES8098/  ---> informe.pdf
        :return: The path to the file.
        """
        return f'consecutivos/{self.codigo}/'

    no = models.CharField(max_length = 10, verbose_name = "número*", unique = True, null = True)
    tipo_codigo = models.ForeignKey(tipo_codigo, on_delete = models.SET('Tipo de código eliminado de la Base de datos'), verbose_name = 'tipo de código*', null = True)
    
    codigo = models.CharField(max_length = 10, verbose_name = 'código*', unique = True, null = True)
    fecha_entrada = models.DateField(default = datetime.now, verbose_name = "fecha de entrada*")
    nombre_proyecto = models.CharField(max_length = 250, verbose_name = 'nombre*', unique = True, null = True)
    formato = models.ManyToManyField(formato, verbose_name = 'formato', related_name = 'formatos_consecutivo')
    tipo = models.ForeignKey(tipo_proyecto, on_delete = models.SET('Tipo de proyecto eliminado de la Base de datos'),
                            verbose_name = 'tipo de proyecto*', null = True)
    area = models.ForeignKey(area, on_delete = models.SET('Área eliminada de la BD'), verbose_name = 'área*')
    trabajador = models.ManyToManyField(trabajador, verbose_name = 'rol en el proyecto*', through = 'trabajador_consecutivo')
    fuente_financiamiento = models.ForeignKey(fuente_financiamiento, on_delete = models.SET('Fuente de financiamiento eliminada de la BD'), verbose_name = 'fuente de financiamiento*', null = True)
    aprobacion_consejo = models.CharField(max_length = 25, verbose_name = 'aprobación Consejo Editorial', null = True, blank = True)
    fecha_aprobacion = models.DateField(default = datetime.now, verbose_name = "fecha de aprobación Consejo Editorial", null = True, blank = True)
    fecha_inicio = models.DateField(default = datetime.now, verbose_name = "fecha de inicio*")
    fecha_interrupcion = models.DateField(default = datetime.now, verbose_name = "fecha de interrupción", null = True, blank = True)
    causa_interrupcion = models.CharField(max_length = 250, verbose_name = 'causa de la interrupción', null = True, blank = True)
    fecha_terminacion = models.DateField(verbose_name = "fecha de fin", null = True, blank = True)
    fecha_extension = models.DateField(verbose_name = "fecha de extensión", null = True, blank = True)
    fecha_cierre = models.DateField(verbose_name = "fecha de cierre*", null = True)
    costo = models.IntegerField(default = 0, validators=[MinValueValidator(1000), MaxValueValidator(9999999)],
                            verbose_name = 'costo*')
    observacion = models.CharField(max_length = 250, verbose_name = 'observacion', null = True, blank = True)
    informe_apertura = models.FileField(upload_to = 'ruta/', verbose_name = 'informe apertura', null = True, 
                        blank = True)
    informe_cierre = models.FileField(upload_to = 'ruta/', verbose_name = 'informe cierre', null = True, blank = True)
    linea_tematica = models.ForeignKey(linea_tematica, verbose_name = 'línea temática',
                        on_delete = models.SET('Línea temática eliminada de la BD'), null = True, blank = True)
    estado = models.ForeignKey(estado_proyecto, on_delete = models.SET('Estado eliminado de la BD'), verbose_name = 'estado*')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.codigo + ' ' + self.nombre_proyecto)

    def __unicode__(self):
        return str(self.codigo + ' ' + self.nombre_proyecto)  

# Modulo SOSI Erik
class sosi(consecutivo):
    # valorar herencia
    numero_salva = models.CharField(max_length = 10, verbose_name = "Número de salva*")
    fecha = models.DateField(default = datetime.now, verbose_name = 'Fecha de entrega*')
    #agregar esto
    anno = models.CharField(max_length=4, verbose_name = 'Año al que corresponde la salva', null = True)
    especialista = models.ForeignKey(trabajador, on_delete = models.SET('Trabajador eliminado'), verbose_name = 'Trabajador que entrega*')
    #agregar esto
    autor = models.CharField(max_length = 50, verbose_name = 'Autor del proyecto', null = True, blank = True)
    ubicacion_salva = models.CharField(max_length = 10, verbose_name = 'Ubicación de la salva',
                                    null = True, blank = True)
    observaciones = models.CharField(max_length = 150, verbose_name = 'Observaciones',
                                    null = True, blank = True)
    # campo para subir archivos 
    #eliminado = models.BooleanField(default = True, verbose_name = "Activo")

    def __str__(self):
        return super().codigo + self.numero_salva

class proyecto(models.Model):
    def ruta(self):
        """
        It returns a string that is the path to the folder where the file will be saved
        proyectos/DES8098/  ---> informe.pdf
        :return: The path to the file.
        """
        return f'proyectos/{self.codigo}/'

    no = models.CharField(max_length = 10, verbose_name = "número*", unique = True, null = True)
    tipo_codigo = models.ForeignKey(tipo_codigo, on_delete = models.SET('Tipo de código eliminado de la Base de datos'), verbose_name = 'tipo de código*', null = True)
    codigo = models.CharField(max_length = 10, verbose_name = 'código*', unique = True, null = True)
    fecha_entrada = models.DateField(default = datetime.now, verbose_name = "fecha de entrada*")
    nombre_proyecto = models.CharField(max_length = 250, verbose_name = 'nombre*', unique = True, null = True)
    formato = models.ManyToManyField(formato, verbose_name = 'formato', related_name = 'formatos_proyecto')
    tipo = models.ForeignKey(tipo_proyecto, on_delete = models.SET('Tipo de proyecto eliminado de la Base de datos'),
                            verbose_name = 'tipo de proyecto*', null = True)
    area = models.ForeignKey(area, on_delete = models.SET('Área eliminada de la BD'), verbose_name = 'área*')
    trabajador = models.ManyToManyField(trabajador, verbose_name = 'rol en el proyecto*', through = 'trabajador_proyecto')
    fuente_financiamiento = models.ForeignKey(fuente_financiamiento, on_delete = models.SET('Fuente de financiamiento eliminada de la BD'), verbose_name = 'fuente de financiamiento*', null = True)
    aprobacion_consejo = models.CharField(max_length = 25, verbose_name = 'aprobación Consejo Editorial', null = True, blank = True)
    fecha_aprobacion = models.DateField(default = datetime.now, verbose_name = "fecha de aprobación Consejo Editorial", null = True, blank = True)
    fecha_inicio = models.DateField(default = datetime.now, verbose_name = "fecha de inicio*")
    fecha_interrupcion = models.DateField(default = datetime.now, verbose_name = "fecha de interrupción", null = True, blank = True)
    causa_interrupcion = models.CharField(max_length = 250, verbose_name = 'causa de la interrupción', null = True, blank = True)
    fecha_terminacion = models.DateField(verbose_name = "fecha de fin", null = True, blank = True)
    fecha_extension = models.DateField(verbose_name = "fecha de extensión", null = True, blank = True)
    fecha_cierre = models.DateField(verbose_name = "fecha de cierre*", null = True)
    costo = models.IntegerField(default = 0, validators=[MinValueValidator(1000), MaxValueValidator(9999999)],
                            verbose_name = 'costo*')
    observacion = models.CharField(max_length = 250, verbose_name = 'observacion', null = True, blank = True)
    informe_apertura = models.FileField(upload_to = 'ruta/', verbose_name = 'informe apertura', null = True, 
                        blank = True)
    informe_cierre = models.FileField(upload_to = 'ruta/', verbose_name = 'informe cierre', null = True, blank = True)
    linea_tematica = models.ForeignKey(linea_tematica, verbose_name = 'línea temática',
                        on_delete = models.SET('Línea temática eliminada de la BD'), null = True, blank = True)
    consecutivo = models.OneToOneField(consecutivo, verbose_name = 'consecutivo*',
                        on_delete = models.CASCADE, null = True, related_name = 'proyecto')
    estado = models.ForeignKey(estado_proyecto, on_delete = models.SET('Estado eliminado de la BD'), verbose_name = 'estado*')
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.codigo + ' ' + self.nombre_proyecto)

    def __unicode__(self):
        return str(self.codigo + ' ' + self.nombre_proyecto)  

# moduloJavier
# class rol_trabajador_consecutivo(models.Model):
#     nombre = models.CharField(max_length = 50, verbose_name = 'nombre*',
#                             unique = True, null = True)
#     activo = models.BooleanField(default = True, verbose_name = "activo*")

#     def __str__(self):
#         return str(self.nombre)

# #modulojavier
class rol_trabajador_proyecto(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = 'nombre*',
                            unique = True, null = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

class trabajador_consecutivo(models.Model):
    trabajador = models.ForeignKey(trabajador, verbose_name = 'trabajador*', on_delete = models.CASCADE)
    consecutivo = models.ForeignKey(consecutivo, verbose_name = 'consecutivo*', on_delete = models.CASCADE, null = True)
    rol = models.ForeignKey(rol_trabajador_proyecto, verbose_name = 'rol*', on_delete = models.SET('Rol eliminado de la BD'))

    def __str__(self):
        return str(self.trabajador) + str(self.consecutivo) + str(self.rol)

#esta tabla es el rol del trabajador en el proyecto
class trabajador_proyecto(models.Model):
    trabajador = models.ForeignKey(trabajador, verbose_name = 'trabajador*', on_delete = models.CASCADE)
    proyecto = models.ForeignKey(proyecto, verbose_name = 'proyecto*', on_delete = models.CASCADE)
    rol = models.ForeignKey(rol_trabajador_proyecto, verbose_name = 'rol*', on_delete = models.SET('Rol eliminado de la BD'))
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.trabajador) + " " + str(self.proyecto) + " " + str(self.rol)

# moduloJavier
class dato_adicional(proyecto):
    fecha = models.DateField(verbose_name = 'Fecha del dato adicional*')
    descripcion = models.TextField(max_length = 250, verbose_name = 'Descripcion del dato adicional')

    def __str__(self):
        return str(self.fecha + self.descripcion)

# moduloJavier
class conclusion_adicional(proyecto):
    fecha = models.DateField(verbose_name = 'Fecha de la conclusión adicional*')
    descripcion = models.TextField(max_length = 250, verbose_name = 'Descripcion de la conclusión adicional')

    def __str__(self):
        return str(self.fecha + self.descripcion)

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

    fecha_entrada = models.DateField(default = datetime.now, verbose_name = "fecha*")
    fecha_salida = models.DateField(verbose_name = "Fecha de salida", null = True)
    entregado_por = models.ForeignKey(trabajador, on_delete = models.CASCADE,
                                    verbose_name = "Trabajador que entrega", null = True)
    formato = models.ManyToManyField(formato, verbose_name = 'Formato*')
    proyecto = models.ForeignKey(proyecto, on_delete = models.CASCADE,
                                verbose_name = "Proyecto*", null = True)
    dictamen = models.FileField(upload_to = "entradas_proyectos/", verbose_name = 'informe apertura', null = True, 
                        blank = True)
    estado = models.ForeignKey(estado_entradas_proyecto, on_delete = models.SET_NULL,
                                verbose_name = "Estado entrada proyecto", null = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        # datetime.strptime(datetime.now().strftime('%Y-%m-%d'), "%Y-%m-%d")
        return str(self.fecha_entrada.strftime('%Y-%m-%d')) + str(self.proyecto)
 
# moduloJavier
class entidad(models.Model):
    nombre = models.CharField(max_length = 25, verbose_name = "nombre", unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

# Nomenclador para Cursos Erik
class estado_curso(models.Model):
    estado_curso = models.CharField(max_length = 25, verbose_name = 'Estado del curso')
    activo = models.BooleanField(default = True, verbose_name = "Activo")

    def __str__(self):
        return str(self.estado_curso)

# Nomenclador para Cursos Erik
class modo_formacion(models.Model):
    formacion = models.CharField(max_length = 25, verbose_name = 'Modo de formación')
    activo = models.BooleanField(default = True, verbose_name = "Activo")

    def __str__(self):
        return str(self.formacion)

# Modulo Curso Erik
class curso(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name = 'Nombre del curso*', null = True)
    fecha_inicio = models.DateField(verbose_name = 'Fecha de inicio*', null = True)
    fecha_fin = models.DateField(verbose_name = 'Fecha de fin', blank = True, null = True)
    entidad = models.ForeignKey(entidad, on_delete = models.SET('Entidad eliminada'), verbose_name = 'Entidad*',
                                null = True)
    modo_formacion = models.ForeignKey(modo_formacion, verbose_name = 'Modo de formación*',
                            on_delete = models.SET('Modo de formación eliminado de la BD'),
                            null = True)
    duracion_diaria = models.IntegerField(verbose_name = 'Duración del curso en horas', blank = True, null = True)
    precio = models.FloatField(verbose_name = 'Precio del curso', blank = True, null = True)
    estado_curso = models.ForeignKey(estado_curso, on_delete = models.SET('Estado del curso eliminado'),
                                    verbose_name = 'Estado del curso', null = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo")

    def __str__(self):
        return str(self.nombre)

# Modulo Capacitación Erik
class capacitacion(models.Model):
    fecha_inicio = models.DateField(verbose_name = 'Fecha de inicio*')
    fecha_fin = models.DateField(verbose_name = 'Fecha de fin', blank = True, null = True)
    curso = models.ForeignKey(curso, on_delete = models.SET('Curso eliminado de la BD'), verbose_name = 'Nombre del curso*')
    trabajador = models.ForeignKey(trabajador, on_delete = models.SET('Trabajador eliminado'), verbose_name = 'Trabajador*')
    resultado = models.CharField(max_length = 10, verbose_name = 'Resultado del curso')
    observaciones = models.CharField(max_length = 250, verbose_name = 'Observaciones', blank=True, null=True)
    estado = models.ForeignKey(estado_curso, on_delete = models.SET('Estado del curso eliminado'), verbose_name = 'Estado del curso')
    costo_diario_trabajador = models.FloatField(default = 0.0, validators=[MinValueValidator(0000.0)], verbose_name = 'Costo diario del trabajador en la capacitación', blank = True, null = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo")
    
    def __str__(self):
        return str(self.curso)

# Modulo Auditoria Externa Erik
class auditoria_externa(models.Model):
    fecha = models.DateField(verbose_name = "Fecha de emisión*", null = True)
    registro = models.CharField(max_length = 10, unique = True, verbose_name = 'Número de registro*',
                            null = True)
    titulo = models.CharField(max_length = 150, verbose_name = 'Título del informe*', null = True)
    entidad = models.ForeignKey(entidad, on_delete = models.SET('Entidad eliminada'), verbose_name = 'Entidad*')
    resultados = models.BooleanField(default = True, verbose_name = 'Resultado')
    observaciones = models.CharField(max_length = 250, verbose_name = 'Observaciones', null = True, blank = True)
    informe = models.FileField(upload_to = 'dictamenes/', verbose_name = 'Informe de la auditoria*', null = True, blank = True)
    plan_medidas = models.FileField(upload_to = 'dictamenes/', verbose_name = 'Plan de medidas*', null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo")

    def __str__(self):
        return str(self.titulo)

# moduloAbel(licencia)
class licencia(models.Model):
    no = models.CharField(max_length = 6, verbose_name = "Número licencia", unique = True)
    nombre = models.CharField(max_length = 55, verbose_name = "Nombre licencia*", unique = True)
    entidad = models.ForeignKey(entidad, on_delete = models.DO_NOTHING, verbose_name = 'Entidad*')
    fecha_otorgamiento = models.DateField(verbose_name = "Fecha otorgamiento*")
    fecha_vencimiento = models.DateField(verbose_name = "Fecha vencimiento*")
    proceso = models.ForeignKey(proceso, on_delete = models.DO_NOTHING, verbose_name = 'Proceso*')
    responsable = models.ManyToManyField(trabajador, verbose_name = 'Responsable*', 
                                        help_text = 'Escoja el responsable')
    estado = models.ForeignKey(estado_licencia, on_delete = models.DO_NOTHING, 
                                       verbose_name = 'Estado de la licencia*')
    observaciones = models.TextField(max_length = 500, verbose_name = 'Observaciones', null = True)
    activo = models.BooleanField(default=True, verbose_name="Activo")
  
    def __str__(self):
        return str(self.nombre)

# moduloAbel
class via_recepcion(models.Model):
    nombre = models.CharField(max_length = 55, verbose_name = "Nombre vía de recepción*", unique = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

# moduloAbel(queja)
class accion_realizada(models.Model):
    fecha = models.DateTimeField(verbose_name = "Fecha acción realizada*")
    nombre_accion = models.CharField(max_length = 150, verbose_name = 'Nombre acción*')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self) -> str:
        return str(self.nombre_accion)

# moduloAbel(queja)
class queja(models.Model):
    no = models.TextField(verbose_name = "Número licencia", unique = True)  
    fecha_receppcion =  models.DateTimeField(verbose_name = "Fecha recepción*")
    fecha_cierre =  models.DateTimeField(verbose_name = "Fecha cierre")
    cliente = models.ForeignKey(cliente, on_delete = models.SET('Cliente eliminado de la Base de datos'), 
                                verbose_name = 'Cliente de la queja*')
    proceso = models.ForeignKey(proceso, on_delete = models.SET('Proceso eliminado de la Base de datos'), 
                                verbose_name = "Proceso*")
    via_recepcion = models.ForeignKey(via_recepcion, on_delete = models.SET('Vía de recepción eliminada de la Base de datos'), 
                                verbose_name = 'Cliente de la queja*')
    motivo = models.CharField(max_length = 150, verbose_name = 'Motivo de la queja*')
    activo = models.BooleanField(default=True, verbose_name="Activo")

    def __str__(self) -> str:
        return str(self.no)

# moduloJavier
class premio(models.Model):
    nombre = models.CharField(max_length = 150, verbose_name = "Nombre del premio*", unique = True, null = True)
    entidad = models.ForeignKey(entidad, on_delete = models.SET('CITMATEL'), verbose_name = 'Entidad*')
    fecha = models.DateTimeField(default = datetime.now, verbose_name = "Fecha*")
    archivo = models.FileField(upload_to = 'premios/', verbose_name = 'Planilla de la Reserva',
                            null = True, blank = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)
   
#moduloJavier
class objetivo(models.Model):
    nombre = models.CharField(max_length = 150, verbose_name = 'Nombre de objetivo*', unique = True, null = True)
    fecha_definicion = models.DateField(verbose_name = 'Fecha en que se definió el objetivo*')
    area = models.ForeignKey(area, on_delete = models.SET('Área eliminada de la BD'),
                            verbose_name = 'Área*')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

    # def save(self, *args, **kwargs):
    #     if self.fecha_definicion.strftime('%Y') > datetime.now().strftime('%Y'):
    #         raise objetivo.ValidationError("El año en que se traza el objetivo no puede ser mayor que el año actual")
    #     super(objetivo, self).save(*args, **kwargs)
    
#moduloJavier
class estado_indicador_objetivos(models.Model):
    nombre = models.CharField(max_length = 20, verbose_name = 'nombre*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "activo*")

    def __str__(self):
        return str(self.nombre)

#moduloJavier
class indicador_objetivos(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = "Nombre del indicador*", null = True)
    evaluacion = models.FloatField(verbose_name = 'Evaluación del indicador*')
    objetivo = models.ForeignKey(objetivo, on_delete = models.CASCADE, verbose_name = 'Objetivo*', 
                                related_name = 'objetivos', null = True)
    estado = models.ForeignKey(estado_indicador_objetivos, on_delete = models.SET('Estado eliminado'), verbose_name = 'Estado*', 
                                null = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")
        
    def __str__(self):
        return str(self.nombre)

#moduloJavier
class accion_indicador_objetivos(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = "Nombre de la acción*", unique = True)
    evaluacion = models.FloatField(verbose_name = 'Evaluación de la acción*')
    indicador_objetivos = models.ForeignKey(indicador_objetivos, on_delete = models.SET('Indicador eliminado de la BD'),
                                    verbose_name = 'Indicador al que pertenece*', null = True)
    area = models.ForeignKey(area, on_delete = models.SET('Area eliminado de la BD'),
                                    verbose_name = 'Area a la que pertenece*', null = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")
    
    def __str__(self):
        return str(self.nombre)
    
# moduloAbel(propiedad_industrial)
class modalidad(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name = 'Nombre de modalidad*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

# moduloAbel(propiedad_industrial)
class clasificacion_productos_servicios(models.Model):
    nombre = models.CharField(max_length =150, verbose_name = 'Nombre de clasificación*', unique = True)
    producto = models.BooleanField(default = False, verbose_name = 'Es un producto')
    servicio = models.BooleanField(default = False, verbose_name = 'Es un servicio')
    activo = models.BooleanField(default = True, verbose_name = "Activo*")
 
    def __str__(self):
        return str(self.nombre)

# moduloAbel(propiedad_industrial)
class clasificacion_viena(models.Model):
    nombre = models.CharField(max_length = 20, verbose_name = 'Nombre de la clasificación de Viena', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

# moduloAbel(propiedad_industrial)
class clasificacion_elemento_figurativo(models.Model):
    nombre = models.CharField(max_length = 150, verbose_name = 'Clasificación de Elemento Figurativo', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

# moduloAbel(propiedad_industrial)
class clasificacion_dibujo_modelo_industrial(models.Model):
    nombre = models.CharField(max_length = 150, verbose_name = 'Nombre clasificación de Dibujo y Modelo Industrial', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)        

# moduloAbel(propiedad_industrial)
class clasificacion_patente(models.Model):
    nombre = models.CharField(max_length = 150, verbose_name = 'Nombre clasificacion de patente', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

# moduloAbel
class estado_propiedad_industrial(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name = 'Estado de propiedad industrial*', unique = True)
    activo = models.BooleanField(default = True, verbose_name = "Activo*")

    def __str__(self):
        return str(self.nombre)

# moduloAbel(propiedad_industrial)
class propiedad_industrial(models.Model):
    nombre = models.CharField(max_length = 80, verbose_name = "Nombre*")
    modalidad = models.ForeignKey(modalidad, on_delete = models.SET('Modalidad eliminada de la Base de datos*'), verbose_name = 'Modalidad*')
    pais = models.ForeignKey(pais, on_delete = models.SET('Pais eliminado'), verbose_name = 'País*')
    fecha_solicitud = models.DateField(verbose_name = "Fecha de solicitud*")
    no_solicitud = models.CharField(max_length = 9, verbose_name = "Número de solicitud*", unique = True)
    clasificacion_productos_servicios = models.ForeignKey(clasificacion_productos_servicios, on_delete = models.SET('Clasificación de productos y servicios eliminada de la Base de datos'),
                                                 verbose_name = 'Clasificación Productos y Servicios')
    clasificacion_viena = models.ForeignKey(clasificacion_viena, on_delete = models.SET('Clasificación de Viena eliminada de la Base de datos'),
                                                       verbose_name = 'Clasificación de Viena')
    clasificacion_elemento_figurativo = models.ForeignKey(clasificacion_elemento_figurativo, on_delete = models.SET('Clasificación de Elemento Figurativo eliminado de la Base de datos'),
                                                       verbose_name = 'Clasificación de Elementos Figurativos')
    clasificacion_dibujo_modelo_industrial = models.ForeignKey(clasificacion_dibujo_modelo_industrial, 
                                                       on_delete = models.SET('Clasificación Dibujo y Modelo Industrial eliminado de la Base de datos'),
                                                       verbose_name = 'Clasificación dibujo modelo industrial') 
    clasificacion_patente = models.ForeignKey(clasificacion_patente, on_delete = models.SET('Clasificación de Patente eliminada de la Base de datos'),
                                                       verbose_name = 'Clasificación de patentes')                                                                                                     
    no_certificado = models.CharField(max_length = 9, verbose_name = "Número de Certificado*", unique = True)
    concedido_por = models.CharField(max_length = 80, verbose_name = "Concedido por")
    tipo_documento = models.CharField(max_length = 80, verbose_name = "Tipo de documento legal")
    vigente_hasta = models.DateField(verbose_name = "Vigente hasta*")
    estado = models.ForeignKey(estado_propiedad_industrial, on_delete = models.SET('Estado eliminado de la Base de datos'), 
                                        verbose_name = 'Estado de la licencia*')
    observaciones = models.TextField(max_length = 500, verbose_name = 'Observaciones')
    activo = models.BooleanField(default=True, verbose_name="Activo")
      
    def __str__(self):
        return str(self.nombre)

# moduloAbel
class notificacion(models.Model):
    cantidad = models.IntegerField(validators = [MinValueValidator(0)], verbose_name = 'Cantidad de notificaciones*')
    licencia = models.ForeignKey(licencia, on_delete = models.CASCADE, 
                                        verbose_name = 'Licencia*')
    premio = models.ForeignKey(premio, on_delete = models.CASCADE, 
                                        verbose_name = 'Premio*')
    propiedad_industrial = models.ForeignKey(propiedad_industrial, on_delete = models.CASCADE, 
                                        verbose_name = 'Propiedad intelectual*', null = True)
    titulo = models.CharField(max_length = 60, verbose_name = 'Título notificación*')

    def __str__(self):
        return str(self.titulo)
#modulo cenda Dayana
class autor(models.Model):
    nombre = models.CharField(max_length = 100, verbose_name = 'nombre y apellidos del autor*',null = True)
    ci = models.CharField(max_length = 11, verbose_name = 'carnet de identidad*')
    pasaporte = models.CharField(max_length = 15, verbose_name = 'pasaporte')
    domicilio_legal = models.CharField(max_length = 250, verbose_name = 'domicilio legal*')
    nacionalidad= models.ForeignKey(pais, verbose_name = 'nacionalidad*',on_delete = models.CASCADE, null = True)#foreing key de nom pais
    correo= models.EmailField( verbose_name = 'correo electrónico',null = True, blank = True )
    telefono = models.CharField(max_length = 10, verbose_name = 'teléfono',null = True, blank = True)
class cenda(consecutivo):
    fecha_solicitud = models.DateField(verbose_name = "fecha de solicitud*",null = True)
    fecha_registro = models.DateField(verbose_name = 'fecha de registro*', null = True)
    titulo = models.CharField(max_length = 150, verbose_name = 'título*', null = True)
    tipo_de_obra =  models.ForeignKey(tipo_de_obra, on_delete = models.CASCADE, 
                                        verbose_name = 'tipo de obra*', null = True)
    codigo_registro = models.CharField(max_length=25, verbose_name = 'No Registro', null = True,blank = True)
    #soporte_presentado =  models.ForeignKey(soporte_presentado , on_delete = models.CASCADE,    
    #                                        verbose_name = 'presentado en Soporte*', null = True)
    # obra_creada =  models.ForeignKey(obra_creada , on_delete = models.CASCADE, 
    #                                     verbose_name = 'obra creada*', null = True)
    # solicitante =models.ForeignKey(trabajador , on_delete = models.CASCADE, 
    #                                     verbose_name = 'solicitante *', null = True)
    autor = models.ForeignKey(autor, on_delete = models.CASCADE,verbose_name = 'datos del autor*', null = True ) 


class CambiarLogotipo(models.Model):
    fecha_cambio = models.DateField(default=datetime.now().strftime('%Y-%m-%d'),verbose_name="Fecha de Cambio del Logotipo")
    logo = models.ImageField(upload_to='logo/', storage=OverwriteStorage(),verbose_name='Logo*')

    def __str__(self):
        return str(self.fecha_cambio.__str__())