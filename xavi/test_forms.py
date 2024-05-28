
import django
from django.test import SimpleTestCase
from django.test import TestCase
from SISGDDO.form import area_form

class URLTests(TestCase):

    def test_homepage(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 302)


    def test_area_form(self):
        form = area_form(data={
            'nombre':'Organización'
        })

        self.assertTrue(form.is_valid(),"Creada con éxito")
    
    def test_area_no_data(self):
        form = area_form(data={
        })

        self.assertFalse(form.is_valid(),"Error en el formulario: nombre requerido")
        self.assertFalse(len(form.errors), 1)

    def test_area_name_error(self):
        form = area_form(data={
             'nombre':'Organ4i6z7ación'
        })

        self.assertFalse(form.is_valid(),"Error en el formulario: Nombre no incluye números")
        self.assertFalse(len(form.errors), 1)