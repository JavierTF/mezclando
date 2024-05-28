from django.db import transaction
from apps.base.models import Employee, ScientificCategory, Position
import psycopg2

def obtener_prefijo(gradodescrip):
    # Mapear gradodescrip al prefijo correspondiente
    prefijos = {
        "licenciado": "Lic",
        "doctor": "Dr. C",
        "master": "Msc"
        # Agregar más mapeos según sea necesario
    }
    return prefijos.get(gradodescrip.lower(), "")  # Devolver el prefijo correspondiente o una cadena vacía si no se encuentra


def MigrarRodas(request):

    conn = psycopg2.connect(
        dbname='r4_citmatel',
        user='r4_rh_listado_trabajadores',
        password='r4_rh_listado_trabajadoresA1234567890a*',
        host='172.16.1.13'
    )
    cursor = conn.cursor()

    # Ejecutar la consulta para obtener los datos de los trabajadores
    cursor.execute('SELECT * FROM rh.listar_trabajadores_plpgsql()')

    # Iterar sobre los resultados y crear instancias de trabajadores en tu base de datos Django
    

    with transaction.atomic():
        for row in cursor.fetchall():
            carnet, nombre, apellido1, apellido2, gradoid, gradodescrip, cargoid, cargodes = row
            if not Position.objects.filter(name=cargodes).exists():
                if cargodes is not None:
                    cargo = Position(
                        name=cargodes
                    )
                    cargo.save()
                else:
                    if not Position.objects.filter(name="Ninguno").exists():
                        cargo = Position(
                            name="Ninguno"
                        )
                        cargo.save()
                    else:
                       cargo=Position.objects.get(name="Ninguno") 
            else:
                cargo=Position.objects.get(name=cargodes)
            
            if not ScientificCategory.objects.filter(name=gradodescrip).exists():
                if gradodescrip is not None:
                    cat = ScientificCategory(
                    prefix=obtener_prefijo(gradodescrip),
                    name=gradodescrip
                    )
                    cat.save()
                else:
                    cat = None
            else:
                cat=ScientificCategory.objects.get(name=gradodescrip)
                
        # Check if an employee with the same identification exists
            if not Employee.objects.filter(identification=carnet).exists():
                apellido = apellido1 +str(' ')+ apellido2
            # Create an Employee instance
                trabajador = Employee(
                    first_name=nombre,
                    last_name=apellido,
                    scientific_category=cat,
                    identification=carnet,
                    position=cargo  # Assuming cargodes contains the position
                )
            # Save the employee in the Django database
                trabajador.save()

# Close the connection to the remote database
    cursor.close()
    conn.close()

