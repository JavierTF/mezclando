from django.utils import timezone


def set_property_number(instance=None, sender=None):

    if instance and instance.id:
        last_property = sender.objects.exclude(id=instance.id).filter(created_date__year=timezone.now().year).order_by('created_date').last()
    else:
        last_property = sender.objects.filter(created_date__year=timezone.now().year).order_by('created_date').last()

    if last_property:
        last_number = last_property.number
        if len(last_number) < 11:
            if len(last_number) == 10:
                try:
                    consecutive = str(int(last_number[9:]) + 1).zfill(4)
                except Exception as e:
                    consecutive = '0001'
            else:
                try:
                    consecutive = str(int(last_property.number[5:]) + 1).zfill(4)
                except Exception as e:
                    consecutive = '0001'
        elif len(last_number) < 10:
            consecutive = str(int(last_number[5:]) + 1).zfill(4)
        else:
            consecutive = str(int(last_number[-4:]) + 1).zfill(4)

        instance.number = '%s%s%s%s' % (timezone.now().strftime('%y'),
                                        timezone.now().strftime('%m'),
                                        timezone.now().strftime('%d'),
                                        consecutive)
    else:
        instance.number = '%s%s%s%s' % (timezone.now().strftime('%y'),
                                        timezone.now().strftime('%m'),
                                        timezone.now().strftime('%d'),
                                        '0001')
