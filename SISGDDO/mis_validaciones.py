from django.core.exceptions import ValidationError
from datetime import datetime
from django.contrib import messages
from django.http import request
from django.shortcuts import render

class my_validates():
    list_ext = ['image/jpeg', 'image/jpg', 'image/png']

    def future_year(anno: int) -> bool:
        if anno > datetime.now().strftime('%Y'):
            try:
                raise ValidationError("Error de validación: fecha futura")
            except:
                return False
        return True

    def non_exist_year(cadena: str, long_minima) -> bool:
        if len(cadena) < long_minima:
            try:
                raise ValidationError("Error de validación: cadena menor que longitud")
            except:
                return False
        return True

    def comparar_valor_gt(obj, valor_a_comparar):
        if len(obj) > valor_a_comparar:
            try:
                raise ValidationError("Error de validación: valor demasiado grande")
            except:
                return False
        return True

    def validar_extensiones_archivos(obj, list_ext = []):
        pass
