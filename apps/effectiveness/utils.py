from apps.effectiveness.models import Effectiveness, Process
import datetime


def get_year_effectiveness():
    years = list()

    for effectiveness in Effectiveness.objects.all().exclude(process__abbreviation='M').exclude(process__abbreviation='P'):
        if str(effectiveness.year) not in [year['year'] for year in years]:
            years.append({'year': str(effectiveness.year), 'semesters': [0, 0], 'total_evaluation': 0})

    years.sort(key=lambda x: x['year'])

    for i, year in enumerate(years):
        for model in Effectiveness.objects.filter(year=year['year']).exclude(process__abbreviation='M').exclude(process__abbreviation='P'):
            for semester in model.semesters.filter(semester=1):
                year['semesters'][0] += semester.total_evaluation
            for semester in model.semesters.filter(semester=2):
                year['semesters'][1] += semester.total_evaluation

        for semester in range(2):
            if len(Effectiveness.objects.filter(year=year['year'], semesters__semester=semester + 1).exclude(process__abbreviation='M').exclude(process__abbreviation='P')) > 0:
                year['semesters'][semester] = year['semesters'][semester] / len(
                    Effectiveness.objects.filter(year=year['year'], semesters__semester=semester + 1).exclude(process__abbreviation='M').exclude(process__abbreviation='P')
                )
            else:
                year['semesters'][semester] = 0

        if year['semesters'][0] > 0 and year['semesters'][1] > 0:
            year['total_evaluation'] = (year['semesters'][0] + year['semesters'][1]) / 2

    return years


def get_total_evaluation(items):
    data = list()

    years = [year['year'] for year in items.values('year')]

    for year in years:
        new_items = items.filter(year=year)
        for i in range(1, 3):
            str_year = "{} Sem. {}".format('I' if i == 1 else 'II', str(year)[-2:])
            evaluation_by_semester = 0
            evaluation_by_semester += sum(item.total_evaluation_by_semester(i) for item in new_items) / len(new_items) if len(new_items) > 0 else 0
            data.append({
                "year": str_year,
                "expenses": f"{evaluation_by_semester:.2f}"
            })
            if year == years[-1] and evaluation_by_semester == 0:
                # data.pop()
                data[-2]['lineDash'] = "5,5"

    return data
