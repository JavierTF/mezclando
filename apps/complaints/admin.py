from django.contrib import admin
from apps.complaints.models import WayOfReception, Complaint, ComplaintAction


@admin.register(WayOfReception)
class WayOfReceptionAdmin(admin.ModelAdmin):
    list_display = ('name', )


class ComplaintActionInLine(admin.TabularInline):
    model = ComplaintAction
    fields = ('date', 'action', )
    extra = 1


@admin.register(Complaint)
class ComplaintAdmin(admin.ModelAdmin):
    readonly_fields = ('number', )
    list_display = ('number', 'reception_date', 'deadline', 'client', 'process', 'way_of_reception', 'reason', 'status', )
    inlines = [ComplaintActionInLine, ]
