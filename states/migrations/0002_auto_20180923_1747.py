# Generated by Django 2.1.1 on 2018-09-23 17:47
import csv
from django.db import migrations

# The column headers map to these years. For example, column 1 is 1990
# data.
csv_years = [1990, 1980, 1970, 1960, 1950, 1940, 1930, 1920, 1910, 1900]


def seed_from_csv(apps, schema_editor):
    State = apps.get_model('states', 'State')
    HistoricalPopulation = apps.get_model('states', 'HistoricalPopulation')

    with open('./states/seed_data/Population_PartII.csv', newline='') as csvfile:
        state_reader = csv.reader(csvfile, delimiter=',')
        for index, row in enumerate(state_reader):
            # Alabama - Wyoming are on lines 9-59.
            if index >= 9 and index <= 59:
                state_name = row[0]
                state, created = State.objects.get_or_create(name=state_name)
                print('created state: {}'.format(state.name))

                # Populations from 1990 - 1900 exist at indices 1-11.
                populations = row[1:11]
                for index, population in enumerate(populations):
                    population_int = int(population.replace(',', ''))
                    historical_population = HistoricalPopulation.objects.create(
                        year=csv_years[index], population=population_int, state=state)
                    print('created historical population data: {} - {}'.format(
                        historical_population.year, historical_population.population))


def remove_seed_data(apps, schema_editor):
    State = apps.get_model('states', 'State')
    HistoricalPopulation = apps.get_model('states', 'HistoricalPopulation')
    State.objects.all().delete()
    HistoricalPopulation.objects.all().delete()


class Migration(migrations.Migration):

    dependencies = [
        ('states', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(seed_from_csv, remove_seed_data)
    ]
