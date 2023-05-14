from django import template
import datetime
from django.template import Variable
from django.template.defaultfilters import register, stringfilter


@register.filter_function
def splitwidth(value, arg):
    '''
    Sub this values and args if is posibile
    Returns empty string if some error
    '''
    try:
        if arg:
            return value.split(arg)
    except:
        return value
    return value


@register.filter_function
def sinceyear(value, arg=None):
    '''
    Sub this values and args if is posibile
    Returns empty string if some error
    '''
    try:
        if arg:
            intarg = int(arg)
            intvalue = int(value)
            if intvalue < intarg:
                return 'hace %s años' % (intarg - intvalue)
            elif intvalue > intarg:
                return 'faltan %s años' % (intvalue - intarg)
            else:
                return 'este mismo año'
        else:
            intvalue = int(value)
            actual_year = datetime.date.today().year
            if intvalue < actual_year:
                return 'hace %s años' % (actual_year - intvalue)
            elif intvalue > actual_year:
                return 'faltan %s años' % (intvalue - actual_year)
            else:
                return 'este mismo año'
    except:
        return value
    return value


@register.filter_function
def toint(value):
    try:
        return int(value)
    except:
        return value


@register.filter_function
def tointfive(value):
    try:
        result = int(value) + 5
        return result
    except:
        return value


@register.filter(is_safe=False)
def filter(value, arg):
    values = []

    try:
        field, equal = arg.split(':')
    except:
        return values
    else:
        for i in range(0, len(value)):
            try:
                variable = str(Variable(field).resolve(value[i]))
            except:
                continue
            else:
                if variable == equal:
                    values.append(value[i])
    finally:
        return values


@register.filter(is_safe=False)
def filterinverted(value, arg):
    values = []

    try:
        field, equal = arg.split(':')
    except:
        return values
    else:
        for i in range(0,len(value)):
            try:
                variable = str(Variable(field).resolve(value[i]))
            except:
                continue
            else:
                if variable != equal:
                    values.append(value[i])
    finally:
        return values
