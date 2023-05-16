from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from apps.base.models import Employee, Process
import datetime

SEMESTER = (
    (1, "1ER. SEMESTRE"),
    (2, "2DO. SEMESTRE"),
)


def year_choices():
    return [(r, r) for r in range(1984, datetime.date.today().year + 1)]


def current_year():
    return datetime.date.today().year


class Indicator(models.Model):
    name = models.CharField(max_length=150, verbose_name='Nombre del Indicador')
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class IndicatorMeasurer(models.Model):
    indicator = models.ForeignKey(Indicator, on_delete=models.CASCADE, related_name='objectives')
    name = models.CharField(max_length=255, verbose_name='Nombre del medidor')
    qualification = models.PositiveIntegerField(default=1, verbose_name='Calificación', validators=[MinValueValidator(1), MaxValueValidator(5)])

    class Meta:
        unique_together = ('indicator', 'name',)

    def __str__(self):
        return self.name


class Effectiveness(models.Model):
    process = models.ForeignKey(Process, on_delete=models.CASCADE, related_name='effectiveness', verbose_name="Proceso")
    year = models.IntegerField(verbose_name="Año", choices=year_choices(), default=current_year)

    class Meta:
        unique_together = ('process', 'year', )

    def __str__(self):
        return "{process} {year}".format(process=self.process.name, year=self.year)

    @property
    def is_effective(self):
        return True if self.total_evaluation >= 4 else False

    @property
    def total_evaluation(self):
        total_qualification = 0
        total_indicators = 0
        for semester in self.semesters.all():
            for indicator in semester.indicators.all():
                total_qualification += indicator.measurer.qualification
            total_indicators += len(semester.indicators.all())
        return total_qualification / total_indicators if total_indicators > 0 else 0

    def total_evaluation_by_semester(self, semester=1):
        total_qualification = 0
        total_indicators = 0
        semester = self.semesters.filter(semester=semester)
        if semester:
            semester = semester.first()
            for indicator in semester.indicators.all():
                total_qualification += indicator.measurer.qualification
            total_indicators += len(semester.indicators.all())
        return total_qualification / total_indicators if total_indicators > 0 else 0

    def get_evaluator(self):
        evaluators = list()
        for semester in self.semesters.all():
            if hasattr(semester, 'evaluator') and semester.evaluator:
                if semester.evaluator.get_full_name() not in evaluators:
                    evaluators.append(semester.evaluator.get_full_name())
        return " / ".join(evaluators)


class EffectivenessSemester(models.Model):
    effectiveness = models.ForeignKey(Effectiveness, on_delete=models.CASCADE, related_name='semesters')
    semester = models.PositiveSmallIntegerField(verbose_name="Semestre", choices=SEMESTER, default=1, validators=[MinValueValidator(1), MaxValueValidator(2)])

    class Meta:
        unique_together = ('effectiveness', 'semester', )

    @property
    def is_effective(self):
        return True if self.total_evaluation >= 4 else False

    @property
    def total_evaluation(self):
        total = 0
        for indicator in self.indicators.all():
            total += indicator.measurer.qualification
        return total / len(self.indicators.all()) if len(self.indicators.all()) > 0 else 0

    @property
    def evaluator(self):
        if hasattr(self.effectiveness.process, 'responsible'):
            return self.effectiveness.process.responsible
        return None


class SemesterMeasurer(models.Model):
    semester = models.ForeignKey(EffectivenessSemester, on_delete=models.CASCADE, related_name='indicators')
    measurer = models.ForeignKey(IndicatorMeasurer, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('semester', 'measurer', )
