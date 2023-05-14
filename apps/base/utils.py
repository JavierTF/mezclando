from django.contrib.admin.models import LogEntry
from django.contrib.contenttypes.models import ContentType
from apps.base.models import LogoEntity


def get_page_body(boxes):
    for box in boxes:
        if box.element_tag == 'body':
            return box

        return get_page_body(box.all_children())


def get_logos():
    logo1 = None
    logo2 = None
    if LogoEntity.objects.exists():
        logos = LogoEntity.objects.first()
        logo1 = logos.logo1
        logo2 = logos.logo2

    return {'logo1': logo1, 'logo2': logo2}


def get_client_ip(request):
    x_forwarded_for = request.META.get('X-Forwarded-For')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


def logs(request, model, instance, action):
    """
    @Desc: Funcion utilizada para registrar los logs de las acciones generadas por el usuario
    action flag
    0 view,
    1 add,
    2 change,
    3 remove,
    4 sign in,
    5 logout,
    6 activate,
    7 deactivate,
    8 reactivate,
    9 Error User Password,
    10 user login apk, 11 data base
    """
    if request.user.pk:
        LogEntry.objects.log_action(
            user_id=request.user.pk,
            content_type_id=ContentType.objects.get_for_model(model).pk,
            object_id=instance.pk,
            object_repr=instance.__str__(),
            change_message=get_client_ip(request),
            action_flag=action
        )
