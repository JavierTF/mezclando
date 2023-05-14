from django.test import TestCase
from django.db import IntegrityError
from numbers import Real
import re
from datetime import datetime
from SISGDDO.models import area, premio, entidad, objetivo, indicador_objetivos
from SISGDDO.form import linea_tematica_form

# Create your tests here.
class TestSum(TestCase):

    def test_numbers(self):
        nombre = 'SISGEPO'
        self.assertNotIsInstance(nombre, Real, "No es un número")

    def test_letters(self):
        numero = 561
        self.assertNotIsInstance(numero, str, "No es alfabético")

    def test_None1(self):
        cadena = ''
        self.assertEqual(cadena, '', "Está vacía")

    def test_None4(self):
        nada = None
        self.assertIsNone(nada, "No existe el elemento")

    def div(self, x, y):
        if y == 0:
            raise ZeroDivisionError("Division by zero")
        return x / y

    def test_division(self):
        self.assertRaises(ZeroDivisionError, self.div, 5, 0)

    def test_contraseña(self):
        '''La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula, al menos una mayúscula y al menos un caracter no alfanumérico.'''
        regex = '^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$'
        self.assertRegex('Tesis2022.*/', regex, "La contraseña no es segura")

    def test_premio(self):
        self.entidad1 = entidad.objects.create(nombre = 'CITMATEL')
        self.premio1 = premio.objects.create(
            nombre = 'Reconocimiento',
            entidad = self.entidad1            
        )  
        citmatel = entidad.objects.get(nombre = 'CITMATEL')
        p = premio.objects.get(nombre = 'Reconocimiento', entidad = citmatel)
        self.assertEqual(p.activo, True)

    def get_indicador(self):
        return indicador_objetivos.objects.get(nombre = 'onDelete Cascade')

    def test_ondelete_cascade(self):
        hoy = datetime.strptime(datetime.now().strftime('%Y-%m-%d'), "%Y-%m-%d")
        self.objetivo1 = objetivo.objects.create(
            nombre = 'Probar esta funcionalidad',
            fecha_definicion = hoy,
            activo = False
        )
        self.ind = indicador_objetivos.objects.create(
            nombre = 'onDelete Cascade',
            objetivo = self.objetivo1          
        )
        obj = objetivo.objects.get(nombre = 'Probar esta funcionalidad')
        obj.delete()
        self.assertRaises(indicador_objetivos.DoesNotExist, self.get_indicador)

    def create_area(self):
        return area.objects.create(nombre = 'Web')

    def test_same_name(self):
        self.area1 = area.objects.create(nombre = 'Web')
        self.assertRaises(IntegrityError, self.create_area)

    def test_linea_tematica_form(self):
        form = linea_tematica_form(data={
            'nombre': 'Naturaleza',
            'anno': '2022',
        })

        self.assertTrue(form.is_valid(), "Creada con éxito")

    def test_linea_tematica_no_data(self):
        form = linea_tematica_form(data={
        })

        self.assertFalse(form.is_valid(), "Error en el formulario: nombre requerido")
        self.assertEquals(len(form.errors), 1)

    def test_linea_tematica_year_error(self):
        form = linea_tematica_form(data={
            'nombre': 'Naturaleza',
            'anno': '20225',
        })

        self.assertFalse(form.is_valid(), "Error en el formulario: año inexistente")
        self.assertEquals(len(form.errors), 1)