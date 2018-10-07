from django.db import models


class State(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class HistoricalPopulation(models.Model):
    state = models.ForeignKey('State', related_name='historical_populations', on_delete=models.CASCADE)
    year = models.PositiveSmallIntegerField()
    population = models.IntegerField()

    def __str__(self):
        return '{} - {}'.format(self.year, self.population)

    @property
    def state_name(self):
        return self.state.name
