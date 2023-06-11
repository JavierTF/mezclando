from selenium import webdriver
# from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select
import time
from datetime import datetime
import requests
import string
import random

# Opening a URL in the browser.
driver = webdriver.Opera()
driver.get("http://127.0.0.1:8000")

username = driver.find_element_by_name('username')
password = driver.find_element_by_name('password')

username.send_keys('proyecto')
password.send_keys('hectoralonso87')

btn_sumbit = driver.find_element_by_class_name('btn')

s = driver.session_id

btn_sumbit.click()

ses = requests.session()
ses.get("http://127.0.0.1:8000")

for item in ses.cookies:
    driver.add_cookie(
        {'httpOnly': False, 'name': item.name, 'value': item.value, 'domain': item.domain, 'path': item.path,
         'secure': item.secure})

driver.get('http://127.0.0.1:8000/adicionar/consecutivo')

formato = Select(driver.find_element(By.NAME, 'tipo_codigo'))
formato.select_by_visible_text("Servicio")

fecha_entrada = driver.find_element_by_name('fecha_entrada')
fecha_entrada.click()
fecha_entrada.send_keys('04/11/2022')

nombre_proyecto = driver.find_element_by_name('nombre_proyecto')
letters = string.digits
v = ''.join(random.choice(letters) for i in range(2))
nombre_proyecto.send_keys(f'EN TALLA PIEDRAAA {v}')

formato = Select(driver.find_element(By.NAME, 'formato'))
formato.select_by_visible_text("APK")
formato.select_by_visible_text("IBD")
formato.select_by_visible_text("EPUB")

tipo = Select(driver.find_element(By.NAME, 'tipo'))
tipo.select_by_visible_text("Otro proyecto")

area = Select(driver.find_element(By.NAME, 'area'))
area.select_by_visible_text("Multimedia")

jefe_proyecto = Select(driver.find_element(By.NAME, 'jefe_proyecto'))
jefe_proyecto.select_by_visible_text("Javier Toussent Fis")

fuente_financiamiento = Select(driver.find_element(By.NAME, 'fuente_financiamiento'))
fuente_financiamiento.select_by_visible_text("CITMATEL")

aprobacion_consejo = driver.find_element_by_name('aprobacion_consejo')
aprobacion_consejo.send_keys('Acuerdo 123 del 2022')

fecha_aprobacion = driver.find_element_by_name('fecha_aprobacion')
driver.execute_script(
    'var date = new Date(); var currentDate = date.toISOString().substring(0,10); document.getElementById("id_fecha_aprobacion").value = "2022-11-04";')

fecha_inicio = driver.find_element_by_name('fecha_inicio')
driver.execute_script(
    'var date = new Date(); var currentDate = date.toISOString().substring(0,10); document.getElementById("id_fecha_inicio").value = "2022-11-04";')

fecha_interrupcion = driver.find_element_by_name('fecha_interrupcion')
driver.execute_script(
    'var date = new Date(); var currentDate = date.toISOString().substring(0,10); document.getElementById("id_fecha_interrupcion").value = "2022-11-04";')

causa_interrupcion = driver.find_element_by_name('causa_interrupcion')
causa_interrupcion.send_keys('Causa 1 \n Causa 2 \n Causa 3')

fecha_terminacion = driver.find_element_by_name('fecha_terminacion')
driver.execute_script(
    'var date = new Date(); var currentDate = date.toISOString().substring(0,10); document.getElementById("id_fecha_terminacion").value = "2022-11-04";')

fecha_extension = driver.find_element_by_name('fecha_extension')
driver.execute_script(
    'var date = new Date(); var currentDate = date.toISOString().substring(0,10); document.getElementById("id_fecha_extension").value = "2022-11-04";')

fecha_cierre = driver.find_element_by_name('fecha_cierre')
driver.execute_script(
    'var date = new Date(); var currentDate = date.toISOString().substring(0,10); document.getElementById("id_fecha_cierre").value = "2022-11-04";')

costo = driver.find_element_by_name('costo')
costo.send_keys('25000')

observacion = driver.find_element_by_name('observacion')
observacion.send_keys('blah balh blah blah')

linea_tematica = Select(driver.find_element(By.NAME, 'linea_tematica'))
linea_tematica.select_by_visible_text("Naturaleza")

estado = Select(driver.find_element(By.NAME, 'estado'))
estado.select_by_visible_text("atrasado")

activo = driver.find_element_by_name('activo')

# driver.execute_script('var btn = document.getElementById("boton"); btn.click();')
# btn = driver.find_element_by_xpath('//button')
# btn.click()