from ldap3 import Server, Connection, ALL, Tls
import ssl
from django.contrib.auth.models import User

# Definir los parámetros de conexión LDAP
def sinc_usuarios_LDAP():     
# ldap_server = 'dc3.citmatel.inf.cu'
# ldap_port = 3268
# ldap_user = 'CN=CWAService,CN=Users,DC=citmatel,DC=inf,DC=cu'
# ldap_password = '123456789'
# tls_configuration = Tls(validate=ssl.CERT_NONE, version=ssl.PROTOCOL_TLS)
# Crear una conexión al servidor LDAP
# server = Server(ldap_server, port=ldap_port, use_ssl=False, tls=tls_configuration)
# conn = Connection(server, user=ldap_user, password=ldap_password, auto_bind=True)

# Realizar una búsqueda LDAP
# base_dn = 'CN=Users,DC=citmatel,DC=inf,DC=cu'
# search_filter = '(objectClass=*)'  # Puedes ajustar este filtro según tus necesidades
# conn.search(search_base=base_dn, search_filter=search_filter, search_scope='SUBTREE')

# for entry in conn.entries:
#   username = entry.cn.value
#   email = entry.mail.value
#   if not User.objects.filter(username=username).exists():
#        user = User.objects.create_user(username=username, email=email)
#        user.save()
#        print(f'Usuario "{username}" creado con éxito.')
#   else:
#        print(f'El usuario "{username}" ya existe en la base de datos.')


# conn.unbind()
  s = Server('dc3.citmatel.inf.cu', port = 3268, get_info=ALL)
 # c = Connection(s, user='cn=cwaservice,dc=citmatel,dc=inf,dc=cu', password='kemet123456*', auto_bind = True)
  #c = Connection(s, user='cn=cwaservice', password='kemet123456*', auto_bind = True)
  c = Connection(s, user='cwaservice@citmatel.inf.cu', password='kemet123456*', auto_bind = True)
  c.start_tls()
  c.bind()
  c.search('cn=users,dc=citmatel,dc=inf,dc=cu', '(uid=*)', attributes=['sn','cn','homeDirectory'], size_limit=0)
  for dn,attrs,raw_attrs in c.response:
      email= dn
      username = attrs['cn']        # Verificar si el usuario ya existe en la base de datos Django
      if not User.objects.filter(username=username).exists():
            # Crear un nuevo usuario si no existe
            user = User.objects.create_user(username=username, email=email,password='A123456a')
            user.save()
  

     