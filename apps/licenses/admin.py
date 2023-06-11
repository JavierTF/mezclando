from django.contrib import admin
from apps.licenses.models import License


@admin.register(License)
class IndicatorAdmin(admin.ModelAdmin):
    readonly_fields = ('number', )
    list_display = ('number', 'name', 'entity', 'grant_date', 'expiration_date', 'process', 'responsible', 'associated_process', 'status', 'observation', )
