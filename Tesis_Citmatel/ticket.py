from Tesis_Citmatel.wsgi import *
from django.template.loader import get_template
from weasyprint import HTML,CSS
from Tesis_Citmatel.settings import *

def printTicket():
    template = get_template("reportes/reportecapacitacionpdf.html")
    context = {"name": "Juliet"}
    html_template = template.render(context)
    # css_url = os.path.join(BASE_DIR, 'static/assets/plugins/bootstrap/css/bootstrap-responsive.css')
    css_url = os.path.join(BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
    # css_url1 = os.path.join(BASE_DIR, 'static/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.css')
    # css_url2 = os.path.join(BASE_DIR, 'static/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css')
    # css_url3 = os.path.join(BASE_DIR, 'static/assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css')

    # HTML(string=html_template).write_pdf(target="ticket.pdf", stylesheets=[CSS(css_url),CSS(css_url1),CSS(css_url2),CSS
    # (css_url3)])
    HTML(string=html_template).write_pdf(target="ticket.pdf", stylesheets=[CSS(css_url)])


printTicket()
