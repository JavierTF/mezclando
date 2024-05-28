from django.core.exceptions import ObjectDoesNotExist, PermissionDenied
from django.contrib.auth.decorators import login_required, user_passes_test, permission_required
from functools import wraps
import textwrap, traceback
from django.shortcuts import redirect
from datetime import date, timedelta, datetime
from django.utils import timezone
from notifications.signals import notify
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
import random
from xavi.models import proyecto
from django.urls import reverse
from django.http import HttpResponseRedirect
import json
import subprocess

def has_any_permission(user, required_permissions):
    return any(user.has_perm(permission) for permission in required_permissions)

def user_has_any_permission(*required_permissions):
    return user_passes_test(lambda user: has_any_permission(user, required_permissions), login_url=None)

def calcular_porciento(num, total):
    if total == 0:
        return 0
    try:
        div = float(num) / float(total)
        return div * 100
    except Exception as e:
        print(f'Error al hayar el porciento {e}')
        raise
    
def is_superuser(user):
    return user.is_superuser

def handle_exceptions(view_func):
    @wraps(view_func)
    def wrapped_view(request, *args, **kwargs):
        try:
            return view_func(request, *args, **kwargs)
        except (PermissionDenied) as e:
            print('\nExcepción:')
            print('Tipo de excepción:', type(e).__name__)
            print(textwrap.fill(str(e), width=100))
            print('Nombre de la función:', view_func.__name__)
            print('Template:', request.resolver_match.view_name)
            print('Línea de error:', traceback.format_exc().splitlines()[-1])
            print()
            excepcion_info = {
                'tipo': type(e).__name__,
                'mensaje': textwrap.fill(str(e), width=100),
                'nombre_funcion': view_func.__name__,
                'template': request.resolver_match.view_name,
                'linea_error': traceback.format_exc().splitlines()[-1]
            }
            return redirect(reverse('error500') + '?excepcion_info=' + json.dumps(excepcion_info))
        except (TypeError, ObjectDoesNotExist, ValueError, AttributeError) as e:
            print('\nExcepción:')
            print('Tipo de excepción:', type(e).__name__)
            print(textwrap.fill(str(e), width=100))
            print('Nombre de la función:', view_func.__name__)
            print('Template:', request.resolver_match.view_name)
            print('Línea de error:', traceback.format_exc().splitlines()[-1])
            print()
            excepcion_info = {
                'tipo': type(e).__name__,
                'mensaje': textwrap.fill(str(e), width=100),
                'nombre_funcion': view_func.__name__,
                'template': request.resolver_match.view_name,
                'linea_error': traceback.format_exc().splitlines()[-1]
            }
            # return redirect('error404')
            return redirect(reverse('error500') + '?excepcion_info=' + json.dumps(excepcion_info))
        except Exception as e:
            print('\nExcepción:')
            print('Tipo de excepción:', type(e).__name__)
            print(textwrap.fill(str(e), width=100))
            print('Nombre de la función:', view_func.__name__)
            print('Template:', request.resolver_match.view_name)
            print('Línea de error:', traceback.format_exc().splitlines()[-1])
            print()
            excepcion_info = {
                'tipo': type(e).__name__,
                'mensaje': textwrap.fill(str(e), width=100),
                'nombre_funcion': view_func.__name__,
                'template': request.resolver_match.view_name,
                'linea_error': traceback.format_exc().splitlines()[-1]
            }
            print('\n\n\n----->>>>', excepcion_info)
            # return redirect(reverse('error500'), kwargs={'excepcion_info': excepcion_info})
            # return HttpResponseRedirect(reverse('error500') + '?excepcion_info=' + json.dumps(excepcion_info))
            return redirect(reverse('error500') + '?excepcion_info=' + json.dumps(excepcion_info))
    return wrapped_view

@handle_exceptions
def validar_fecha(fecha_str, comparacion='menor_igual', fecha_comparar=None):
    resultado = True

    fecha = datetime.strptime(fecha_str, '%Y-%m-%d').date()

    if fecha_comparar is None:
        fecha_comparar = timezone.now().date()
    
    if comparacion == 'menor':
        resultado = fecha < fecha_comparar
    elif comparacion == 'mayor':
        resultado = fecha > fecha_comparar
    elif comparacion == 'menor_igual':
        resultado = fecha <= fecha_comparar
    elif comparacion == 'mayor_igual':
        resultado = fecha >= fecha_comparar
    else:
        raise ValueError("La opción de comparación no es válida")

    return resultado

@handle_exceptions
def validar_objeto(model, lista, formulario, objeto = None): 
    try:  
        response = {}
        
        if 'no' in lista:
            ec = model.objects.filter(no = formulario['no'].value(), activo=True)
            response['result'] = 'errorField'
            response['title'] = 'El número del proyecto ya existe'
            response['field'] = 'no'
            if objeto:
                if len(ec) and ec[0].id != objeto.id:
                    return response
            else:
                if len(ec):
                    return response
            # if len(eo):
            #     response['result'] = 'error'
            #     response['title'] = 'El NO. del proyecto/proyecto ya existe'
            #     response['field'] = 'no'
            #     return response

        if 'codigo' in lista:
            ec = model.objects.filter(codigo=formulario['codigo'].value(), activo=True)
            response['result'] = 'errorField'
            response['title'] = 'El Código del proyecto ya existe'
            response['field'] = 'codigo'
            if objeto:
                if len(ec) and ec[0].id != objeto.id:
                    return response
            else:
                if len(ec):
                    return response
                
        if 'numero' in lista:
            ec = model.objects.filter(numero=formulario['numero'].value(), activo=True)
            response['result'] = 'error'
            response['title'] = 'El número ya existe'
            response['field'] = 'numero'
            if objeto:
                if len(ec) and ec[0].id != objeto.id:
                    return response
            else:
                if len(ec):
                    return response

        if 'nombre_proyecto' in lista:   
            en = model.objects.filter(nombre_proyecto=formulario['nombre_proyecto'].value(), activo=True)
            response['result'] = 'error'
            response['title'] = 'El Nombre del proyecto ya existe'
            response['field'] = 'nombre_proyecto'
            if objeto:
                print('\n\n\n', en[0].id)
                print('\n\n\n', objeto.id)
                if len(en) and en[0].id != objeto.id:
                    print('\n\n\nRETURN MI RESPONSE')
                    return response
            else:
                if len(en):
                    return response
                
        if 'nombre' in lista or 'numero_salva' in lista:
            response['result'] = 'error'
            
            if 'nombre' in lista:     
                # validar que el premio no se repita con la combinacion nombre y anno           
                en = model.objects.filter(nombre=formulario['nombre'].value(), activo=True)
                response['title'] = 'El nombre ya existe'
                response['field'] = 'nombre'
                
            if 'numero_salva' in lista:        
                en = model.objects.filter(numero_salva=formulario['numero_salva'].value(), activo=True)
                response['title'] = 'El número de salva ya existe'
                response['field'] = 'numero_salva'
            
            if objeto:
                if len(en) == 1 and en[0].id != objeto.id:
                    print('\n', 'diferentes', '\n')
                    return response
                if len(en) > 1:
                    # print('\n', 'diferentes', '\n')
                    return response
            else:
                print('\nSIN OBJETO\n')
                if len(en):
                    return response
                
        if 'nombre_objetivo' in lista:  
            response['result'] = 'error'
            response['title'] = 'El Nombre ya existe para el año'
            response['field'] = 'nombre_objetivo'      
            if objeto:
                # print('\n', 'ANNO', objeto.fecha_definicion.year, '\n')
                en = model.objects.filter(nombre=formulario['nombre'].value(), fecha_definicion__year=objeto.fecha_definicion.year, activo=True)
                # print('\n', 'OBTUVE', en, '\n')
                
                if len(en) and en[0].id != objeto.id:
                    # print('\n', 'diferentes', '\n')
                    return response
            else:
                # print('\n', 'OBTUVE SIN OBJETO', en, '\n')
                anno_actual = datetime.now().year
                en = model.objects.filter(nombre=formulario['nombre'].value(), fecha_definicion__year=anno_actual, activo=True)
                if len(en):
                    return response
                
        if 'evaluacion' in lista:   
            ev = formulario['evaluacion'].value()
            try:
                ev = int(ev)
            except:
                pass
            
            response['result'] = 'error'
            response['title'] = 'La evaluación no es válida'
            response['field'] = 'evaluacion'
            
            if ev:
                if isinstance(ev, int) and (1 <= ev <= 5):
                    pass
                else:
                    print("La variable no es de tipo entero.")
                    return response

        response['result'] = 'success'
        response['title'] = 'Validación exitosa'
        return response
    except Exception as e:
        print(f'Error al validar {e}')
        raise

def show_errors(forms):
    if forms.errors:
        response = {}
        """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
        dicc = forms.errors.values()
        field = list(forms.errors.keys())
        print('\n', 'ERRORES EM EL FORMULARIO', field[0], '\n')
        msg = str(dicc).split('\'')
        # messages.error(request, msg[1])
        response['result'] = 'error'
        response['field'] = field[0]
        response['title'] = f'{msg[1]}'
        return response

def get_ultimo(modelo, attrib='no'):
    try:
        # ultimo = modelo.objects.last()
        ultimo = proyecto.objects.filter(activo=True).last()
        no = getattr(ultimo, attrib, None)
        if ultimo is None or no == None:
            no = 1
        else:            
            try:
                no = int(no) + 1
            except ValueError:
                raise ValidationError("Error: El campo 'no' del último objetivo o proyecto debe ser un número.")
        return no
    except Exception as e:
        print(f"Error obteniendo el último 'número': {e}")
        raise
    
def get_ultimo_dependencia(modelo, dependencia):
    try:
        ultimo = modelo.objects.filter(indicador=dependencia).last()
        no = None
        if ultimo is None or ultimo.no == None or ultimo.no == '':
            no = 1
        else:            
            try:
                no = int(ultimo.no) + 1
            except ValueError:
                raise ValidationError("Error: El campo 'no' del último objetivo o proyecto debe ser un número.")
        return no
    except Exception as e:
        print(f"Error obteniendo el último 'número': {e}")
        raise
    
def get_ultimo_dependencia_proyecto(modelo, dependencia):
    try:
        ultimo = modelo.objects.filter(proyecto=dependencia).last()
        no = None
        if ultimo is None or ultimo.no == None or ultimo.no == '':
            no = 1
        else:            
            try:
                no = int(ultimo.no) + 1
            except ValueError:
                raise ValidationError("Error: El campo 'no' del último objetivo o proyecto debe ser un número.")
        return no
    except Exception as e:
        print(f"Error obteniendo el último 'número': {e}")
        raise
    
def calcular_valor_inicial(modelo):
    try:
        q = modelo.objects.filter(activo=True)
        long = len(q)
        return long + 1
    except Exception as e:
        print(f'Ha ocurrido una exception en calcular_valor_inicial {e}')
        
def calcular_dias_atraso(fecha_cierre: datetime) -> int:
    try:
        dias_atraso = 0
        hoy = datetime.strptime(datetime.now().strftime('%Y-%m-%d'), "%Y-%m-%d").date()

        if fecha_cierre > hoy:
            dias_atraso = (fecha_cierre - hoy).days

        return int(dias_atraso)
    except Exception as e:
        print(f"Error en el cálculo de días de atraso: {e}")
        raise
    
def calcular_costo_diario(fecha_inicio: date, fecha_cierre: date, costo: float) -> float:
    try:
        duracion = (fecha_cierre - fecha_inicio).days
        
        if duracion > 0:
            costo_diario = float(costo) / int(duracion)
            costo_diario = round(costo_diario, 2)
        else:
            costo_diario = 0
    except Exception as e:
        print(f"Error en el cálculo del costo diario: {e}")
        raise  # Lanzar la excepción nuevamente si no puedes manejarla adecuadamente

    return costo_diario

def calcular_costo_no_calidad(fecha_inicio: date, fecha_cierre: date, costo: float) -> float:
    try:
        costo_diario_value = calcular_costo_diario(fecha_inicio, fecha_cierre, costo)
        dias_atraso_value = calcular_dias_atraso(fecha_cierre)
        costo_no_calidad = costo_diario_value * dias_atraso_value
        return round(costo_no_calidad, 2)
    except Exception as e:
        print(f"Error en el cálculo del costo de no calidad: {e}")
        raise  # Lanzar la excepción nuevamente si no puedes manejarla adecuadamente
    
def calcular_costo_real(fecha_inicio: date, fecha_cierre: date, costo: float) -> float:
    try:
        costo_no_calidad_value = calcular_costo_no_calidad(fecha_inicio, fecha_cierre, costo)
        costo_total = float(costo) + costo_no_calidad_value
        return round(costo_total, 2)
    except Exception as e:
        print(f"Error en el cálculo del costo real: {e}")
        raise  # Lanzar la excepción nuevamente si no puedes manejarla adecuadamente
    
frases = [
    "He fallado una y otra vez en mi vida: por eso he conseguido el éxito. (Michael Jordan)",
    "El único lugar donde el éxito viene antes del trabajo es en el diccionario. (Vidal Sassoon)",
    "La actitud es la diferencia entre una oportunidad y un obstáculo.",
    "La clave del éxito es empezar antes de que te sientas listo.",
    "El mayor riesgo es no correr ningún riesgo.",
    "La inteligencia emocional es una habilidad más poderosa que cualquier otra cosa.",
    "La capacidad de reconocer tus propias emociones y las de los demás es una fortaleza que te llevará lejos.",
    "La inteligencia emocional no es solo lo que sabes, es también cómo gestionas lo que sientes.",
    "La empatía es una habilidad esencial para el éxito personal y profesional.",
    "El control emocional es la clave para mantener la mente clara y tomar decisiones racionales.",
    "La felicidad es la clave del éxito. Si amas lo que haces, tendrás éxito.",
    "Cree en ti mismo y todo será posible.",
    "No cuentes los días, haz que los días cuenten.",
    "Tu única limitación es tu mente.",
    "La perseverancia no es una carrera larga; son muchas carreras cortas una tras otra.",
    "La excelencia no es un acto, sino un hábito.",
    "Cada día es una nueva oportunidad para cambiar tu vida.",
    "La confianza en uno mismo es el primer secreto del éxito.",
    "La creatividad es la inteligencia divirtiéndose.",
    "La persistencia es el camino del éxito.",
    "Nunca es tarde para ser lo que podrías haber sido.",
    "La grandeza no consiste en nunca caer, sino en levantarte cada vez que caes.",
    "El éxito no es la clave de la felicidad. La felicidad es la clave del éxito.",
    "Haz hoy lo que otros no quieren, haz mañana lo que otros no pueden.",
    "El único lugar donde los sueños son imposibles es en tu propia mente.",
    "La paciencia es la clave de la alegría.",
    "El futuro pertenece a aquellos que creen en la belleza de sus sueños.",
    "Las oportunidades no ocurren. Tú los creas. (Chris Grosser)",
    "La suerte es lo que sucede cuando la preparación encuentra la oportunidad.",
    "La vida es diez porciento lo que nos sucede y noventa porciento cómo reaccionamos a ello.",
    "La mejor manera de predecir el futuro es inventándolo.",
    "El éxito no se trata de la posición que alcanzas, sino de la velocidad con la que te estás moviendo.",
    "Haz que cada día cuente.",
    "El único fracaso real en la vida es no ser fiel a lo que uno sabe.",
    "La diferencia entre una persona exitosa y otras es la falta de voluntad.",
    "El secreto del cambio es enfocar toda tu energía, no en luchar contra lo viejo, sino en construir lo nuevo.",
    "El éxito no es para siempre y el fracaso no es el final. Lo que cuenta es el coraje para continuar.",
    "No puedes cambiar tu destino de un día para otro, pero puedes cambiar tu dirección de un día para otro.",
    "El secreto de llegar a alguna parte es comenzar con cualquier lugar en el que te encuentres.",
    "La única manera de hacer un gran trabajo es amar lo que haces. (Steve Jobs)",
    "El misterio de la vida no es un problema a resolver, sino una realidad a experimentar.",
    "No importa cuántas veces hayas fallado, siempre y cuando nunca te rindas, eventualmente tendrás éxito.",
    "La verdadera medida de la riqueza es cuánto darías por ella.",
    "El mayor error que puedes cometer en la vida es tener siempre miedo de cometer uno.",
    "El único modo de hacer un gran trabajo es amar lo que haces. (Steve Jobs)",
    "Nuestra mayor gloria no es nunca caer, sino levantarnos cada vez que caemos.",
    "No importa lo que haya pasado. No puedes cambiar el pasado, pero puedes mejorar el futuro.",
    "Nada en el mundo puede reemplazar a la perseverancia.",
    "No tengas miedo de renunciar a lo bueno para perseguir lo grandioso.",
    "El éxito es la suma de pequeños esfuerzos repetidos un día sí y otro también. (Robert Collier)",
    "Nunca te rindas en algo que realmente quieres. Es difícil esperar, pero es más difícil arrepentirse.",
    "La vida es como andar en bicicleta. Para mantener el equilibrio, debes seguir adelante.",
    "La única diferencia entre un día bueno y un mal día es tu actitud.",
    "La vida es lo que pasa mientras estás ocupado haciendo otros planes.",
    "A veces las cosas más pequeñas ocupan más espacio en tu corazón.",
    "No importa lo lento que vayas, siempre y cuando no te detengas.",
    "Haz lo que puedas, con lo que tengas, donde estés.",
    "Si esperas condiciones perfectas, nunca empezarás.",
    "El éxito es la capacidad de ir de fracaso en fracaso sin perder el entusiasmo. (Winston Churchill)",
    "No midas el éxito por la cantidad de dinero que tienes, mídelo por la paz mental que tienes.",
    "El verdadero éxito es encontrar tu propósito y trabajar hacia él cada día.",
    "La felicidad no es algo que pospones para el futuro; es algo que diseñas para el presente.",
    "A veces la adversidad es lo que necesitas enfrentar para darte cuenta de lo fuerte que eres.",
    "No tengas miedo de renunciar a lo bueno para perseguir lo grandioso.",
    "No cuentes los días, haz que los días cuenten. (Muhammad Ali)",
    "La vida es demasiado corta para perder el tiempo con personas que ni aprecian ni respetan.",
    "Cree en ti mismo y todo será posible.",
    "La x es la llave que resuelve todos los problemas.",
    "No te preocupes por los fracasos, preocúpate por las posibilidades que pierdes cuando ni siquiera lo intentas. (Jack Canfield)",
    "Lo que haces hoy puede mejorar todos tus mañanas.",
    "El único lugar donde el éxito viene antes que el trabajo es en el diccionario. (Vidal Sassoon)",
    "La felicidad no es un destino, es una forma de vida.",
    "Tu actitud determina tu dirección.",
    "La innovación distingue a los líderes de los seguidores.",
    "La disciplina es el puente entre metas y logros.",
    "La inteligencia emocional es clave en los negocios y la vida.",
    "El conocimiento es poder, pero la acción lleva a resultados.",
    "La única limitación es la que te pones a ti mismo.",
    "Todo el mundo piensa en cambiar a la humanidad, pero nadie piensa en cambiarse a sí mismo. (León Tolstói)",
    "El carácter es lo que eres cuando nadie te mira. (Epicuro)",
    r"Fallas el 100% de los tiros que no haces. (Wayne Gretzky)",
    "Si crees que puedes, tienes razón. Si crees que no puedes, también tienes razón. (Henry Ford)",
    "Una clave importante para la confianza en uno mismo es la preparación. (Arthur Ceniza)",
    "La inteligencia consiste no sólo en el conocimiento, sino también en la destreza de aplicar los conocimientos en la práctica. (Aristóteles)",
    "El éxito no es definitivo, el fracaso no es fatal: lo que cuenta es el coraje de continuar. (Winston Churchill)",
    "Si hiciéramos todo lo que fuéramos capaces, nos sorprenderíamos a nosotros mismos. (Thomas Edison)",
    "Siempre parece imposible... hasta que se hace. (Nelson Mandela)",
    "Hoy es siempre el día más productivo de la semana. (Mark Hunter)",
    "Encuentra algo que te apasione y mantente tremendamente interesado en ello. (Julia Child)",
    "Para tener éxito, primero debemos creer que podemos hacerlo. (Nikos Kazantzakis)",
    "Cuando haces lo correcto, obtienes la sensación de paz y serenidad. Hazlo una y otra vez. (Roy T. Bennett)",
    "No hay grado de dificultad, solo grado de compromiso. (Wíctor Magnus)",
    "Un objetivo sin un plan es solo un deseo. (Antoine de Saint-Exupéry)",
    "El éxito es una combinación de fracaso, errores, confusión y la determinación de seguir intentándolo de todos modos.",
    "Rodéate de gente que desafíe tus ideas o creencias, que te enseñe, que te empuje a ser la mejor versión de sí mismo. (Bill Gates)", 
    "La perfección no es alcanzable, pero si la perseguimos podemos conseguir la excelencia. (Vince Lombardi)",
    "El cambio es la única constante. (Heráclito)",
    "Cuando llegue la inspiración, que me encuentre trabajando. (Pablo Picasso)",
    "No he fracasado. Sólo he encontrado 10.000 maneras que no funcionarán. (Thomas Edison)",
    "La fuerza y el crecimiento sólo llegan a través del esfuerzo y la lucha continuos. (Napoleón Hill)",
    "La pasión es energía. Siente el poder que proviene de centrarte en lo que te emociona. (Oprah Winfrey)",
    "Desarrolla una pasión por el aprendizaje. Si lo haces, nunca dejarás de crecer. (Anthony J. D'Angelo)",
    "Un pesimista ve la dificultad en cada oportunidad; un optimista ve la oportunidad en cada dificultad. (Winston Churchill)",
    "Una idea solo puede hacerse realidad una vez que se descompone en elementos organizados y procesables. (Scott Belsky)",
    "Es hora de que te muevas, dándote cuenta de que lo que buscas también te busca a ti. (Iyanla Vanzant)",
    "Nunca soñé con el éxito. Trabajé para conseguirlo. (Estée Lauder)",
    "Si tus acciones inspiran a otros a soñar más, aprender más, hacer más y convertirse en más, eres un líder. (Simon Sinek)",
    "Cuanto más duramente trabajo, más suerte tengo. (Gary Player)",
    "Tu actitud, no tu aptitud, determinará tu altitud. (Zig Ziglar)",
    "Tienes que hacer las cosas que crees que no puedes hacer. (Eleanor Roosevelt)",
    "No hagas lo que los demás hacen. Haz lo que los demás quisieran hacer y no se atreven.",
    "Todo lo que necesitas para lograr tus objetivos ya está en ti.",
    "Todos nuestros sueños se pueden hacer realidad si tenemos el coraje de perseguirlos.",
    "Debemos creer que tenemos un don en algo y que tenemos un objetivo por lograr.",
    "Utiliza tu imaginación para inspirarte a lograr lo inimaginable.",
    "El éxito en la vida no se mide por lo que logras sino por los obstáculos que superas.",
    "Si buscas resultados distintos, no hagas siempre lo mismo.",
    "Un viaje de diez mil kilómetros empieza por un solo paso.",
    "Comienza a ser ahora lo que serás de ahora en adelante.",
    "Pregúntate si lo que estás haciendo hoy te acerca al lugar en el que quieres estar mañana.",
    
]

def alternar_frase():
    frase_aleatorio = random.randint(0, len(frases) - 1)

    # Acceder a la frase correspondiente al número aleatorio
    frase = frases[frase_aleatorio]
    frase = frase.encode('utf-8').decode('unicode-escape')
    
    return frase

def get_codigo() -> str:
    try:
        # ultimo = proyecto.objects.last()
        ultimo = proyecto.objects.filter(activo=True).last()

        # cod = 00
        try:
            codigo_viejo = ultimo.__getattribute__('codigo')
            try:
                int(ultimo.codigo[-1])
            except:
                raise Exception("Error: El código del último proyecto o proyecto debe terminar en un número.")
            abrev, cod = codigo_viejo[:3], codigo_viejo[3:]
        except:
            pass
        anno_actual = datetime.now().strftime("%Y")
        # anno_actual = 2023
        existe = proyecto.objects.filter(activo = True, creado__year = anno_actual)
        if (len(existe) == 0 or ultimo is None):
            abrev = 'DES'
            dig_anno = str(anno_actual)[-2:]
            cod = dig_anno + '01'
        else:
            cod = str(int(cod) + 1)
        return (abrev + cod)
    except Exception as e:
        print(f'Ha ocurrido un error {e}')
        
def get_or_none(query_set, **kwargs):
    try:
        return query_set.get(**kwargs)
    except:
        return None
    
meses_del_anno = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
]