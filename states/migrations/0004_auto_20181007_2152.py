# Generated by Django 2.1.1 on 2018-10-07 21:52

from django.db import migrations

from states.seed_data.additional_populations import populations


def seed_data(apps, schema_editor):
    State = apps.get_model('states', 'State')
    HistoricalPopulation = apps.get_model('states', 'HistoricalPopulation')

    for year, values_dict in populations.items():
        for state_name, population in values_dict.items():
            # Puerto Rico is not yet in DB so it needs to be created
            state, created = State.objects.get_or_create(name=state_name)
            HistoricalPopulation.objects.create(
                year=year, state=state, population=population)
            print('Added population {} for {}'.format(year, state.name))


def remove_seed_data(apps, schema_editor):
    State = apps.get_model('states', 'State')
    HistoricalPopulation = apps.get_model('states', 'HistoricalPopulation')

    try:
        puerto_rico = State.objects.get(name='Puerto Rico')
    except State.DoesNotExist:
        print('Did not find Puerto Rico in State table.')
    else:
        puerto_rico.delete()
        print('Deleted Puerto Rico State object')

    added_years = [2000, 2010, 2017]
    HistoricalPopulation.objects.filter(year__in=added_years).delete()
    print('Deleted 2000, 2010, and 2017 populations')


class Migration(migrations.Migration):

    dependencies = [
        ('states', '0003_auto_20180923_2251'),
    ]

    operations = [
            migrations.RunPython(seed_data, remove_seed_data)
    ]
