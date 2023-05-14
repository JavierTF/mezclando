from django.test import TestCase

# Create your tests here.
class TestSum(TestCase):

    def test_sum(self):
        self.assertEqual(sum([1, 2, 3]), 6, "Should be 6")