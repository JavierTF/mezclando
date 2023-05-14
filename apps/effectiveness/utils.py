from apps.effectiveness.models import Effectiveness


def get_year_effectiveness():
    years = list()

    for effectiveness in Effectiveness.objects.all():
        if str(effectiveness.year) not in years:
            years.append(str(effectiveness.year))
    years.sort()
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
