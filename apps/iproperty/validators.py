from django.core.validators import BaseValidator, RegexValidator
import datetime


validate_char = RegexValidator('^[a-zA-Z áÁéÉíÍóÓúÚñÑ.]*[a-zA-Z áÁéÉíÍóÓúÚñÑ.]$', message="Solo puede ingresar letras")


class DateInPastValidator(BaseValidator):
    message = 'Asegurese que la fecha no sea menor o igual a %(limit_value)s.'
    code = 'date_in_past'

    def __init__(self, limit_value=datetime.date.today()):
        self.limit_value = limit_value

    def compare(self, a, b):
        return a < b

    def clean(self, x):
        try:
            v = x.date()
        except:
            v = x
        return v


class DateInFutureValidator(BaseValidator):
    message = 'Asegurese que la fecha no sea mayor o igual a %(limit_value)s.'
    code = 'date_in_future'

    def __init__(self, limit_value=datetime.date.today()):
        self.limit_value = limit_value

    def compare(self, a, b):
        return a > b

    def clean(self, x):
        try:
            v = x.date()
        except:
            v = x
        return v