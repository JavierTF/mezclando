from django.template import Library

register = Library()

def No_Definido(value):
    if not value:
        return "No está definido"
    else:
        return value

def Valor_True_False(value):
    if value is True:
        return "Sí"
    else:
        return "No"

register.filter("No_Defi",No_Definido)
register.filter("Si_No",Valor_True_False)