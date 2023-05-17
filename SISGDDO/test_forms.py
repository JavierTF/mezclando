
import django
from django.test import SimpleTestCase
from django.test import TestCase

class URLTests(TestCase):

    def test_homepage(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 302)