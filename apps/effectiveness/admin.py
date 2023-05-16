from django.contrib import admin
import nested_admin
from apps.effectiveness.models import IndicatorMeasurer, Indicator, Effectiveness, EffectivenessSemester, SemesterMeasurer


class IndicatorMeasurerInLine(admin.TabularInline):
    model = IndicatorMeasurer
    fields = ('name', 'qualification', )
    extra = 1


@admin.register(Indicator)
class IndicatorAdmin(admin.ModelAdmin):
    list_display = ('name', 'active', )
    inlines = [IndicatorMeasurerInLine, ]


class SemesterMeasurerInLine(nested_admin.NestedTabularInline):
    model = SemesterMeasurer
    # sortable_field_name = "id"
    # fields = ('indicator', 'qualification')
    extra = 1
    # min_num = 5


class EffectivenessSemesterAdmin(nested_admin.NestedStackedInline):
    model = EffectivenessSemester
    inlines = [SemesterMeasurerInLine, ]
    max_num = 2


@admin.register(Effectiveness)
class EffectivenessAdmin(nested_admin.NestedModelAdmin):
    list_display = ['process', 'get_evaluation', 'is_effective', 'get_year', ]
    inlines = [EffectivenessSemesterAdmin, ]

    @admin.display(description='Evaluación')
    def get_evaluation(self, obj):
        return f'{obj.total_evaluation:.2f}'

    @admin.display(boolean=True, description='Eficaz')
    def is_effective(self, obj):
        return obj.is_effective

    @admin.display(description='Año')
    def get_year(self, obj):
        return obj.year
