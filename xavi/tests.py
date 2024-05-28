from django.test import TestCase
from numbers import Real

# Create your tests here.
class TestSum(TestCase):

    def test_letters(self):
        numero = 561
        self.assertIsInstance(numero, str, "No es alfabético")

    def test_None4(self):
        nada = None
        self.assertIsNone(nada, "No existe el elemento")

    def test_numbers(self):
        nombre = 'SISGEPO'
        self.assertIsInstance(nombre, Real, "No es un número")