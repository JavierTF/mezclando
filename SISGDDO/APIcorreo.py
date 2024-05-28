from pyews import FindItem, EWS
from datetime import datetime, timedelta
from SISGDDO.models import Afectaciones
from xavi.models import area
import re

def pruebacorreo(request):

    ews = EWS(
      'DMY_User01',
      'U123456u*',
      ews_url='http://mail.citmatel.inf.cu/ews/Exchange.asmx'
    )

    query_string = "afectación"

    result=ews.find_items(
        query_string=query_string,
        distinguished_folder_name='inbox',  # Búsqueda en la bandeja de entrada
        base_shape='AllProperties',  # Devolver todas las propiedades de los elementos
        include_mime_content=True,  # Incluir contenido MIME en la respuesta
        body_type='Best',  # Devolver el mejor tipo de cuerpo disponible
        traversal='Shallow',  # Búsqueda superficial (solo en la carpeta especificada)
        reset_cache=False,  # No restablecer la caché antes de la búsqueda
        return_deleted_items=True,  # Devolver elementos eliminados en la búsqueda
        return_highlight_terms=True  # Devolver términos destacados en la búsqueda
    )
    
    for item in result:
        subject = str(item['subject']).replace("afectación", "")
        if not Afectaciones.objects.filter(afectacion=subject).exists():
            afectacion= Afectaciones()
            afectacion.afectacion=subject
            afectacion.fecha_recepcion = datetime.date(item['received_time'])

            body = item['body']
    
    # Buscar la palabra "solicitado por" seguida de cualquier texto hasta el próximo punto
            solicitado_match = re.search(r'solicitado\s+por\s+([^\.]+)', body, re.IGNORECASE)
            if solicitado_match:
                solicitado_por = solicitado_match.group(1).strip()
                if not area.objects.filter(nombre=solicitado_por).exists():
                    ejec = area(
                        nombre=solicitado_por
                    )
                    ejec.save()
                    afectacion.responsable=ejec
                else:
                    afectacion.responsable=area.objects.get(nombre=solicitado_por)
    
    # Buscar la palabra "ejecutor" seguida de cualquier texto hasta el próximo punto
            ejecutor_match = re.search(r'ejecutor\s+([^\.]+)', body, re.IGNORECASE)
            if ejecutor_match:
                ejecutor = ejecutor_match.group(1).strip()
                if not area.objects.filter(nombre=ejecutor).exists():
                    ejec = area(
                        nombre=ejecutor
                    )
                    ejec.save()
                    afectacion.responsable=ejec
                else:
                    afectacion.responsable=area.objects.get(nombre=ejecutor)
                    
            afectacion.save()
