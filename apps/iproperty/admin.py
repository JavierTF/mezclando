from django.contrib import admin
from apps.iproperty.models import ProductClassification, PatentClassification, FigurativeElementClassification, DrawingClassification, IndustrialProperty


@admin.register(ProductClassification)
class ProductClassificationAdmin(admin.ModelAdmin):
    list_display = ('number', 'name', )


@admin.register(PatentClassification)
class PatentClassificationAdmin(admin.ModelAdmin):
    list_display = ('name', )


@admin.register(FigurativeElementClassification)
class FigurativeElementClassificationAdmin(admin.ModelAdmin):
    list_display = ('number', 'name', )


@admin.register(DrawingClassification)
class DrawingClassificationAdmin(admin.ModelAdmin):
    list_display = ('name', )
