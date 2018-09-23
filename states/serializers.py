from rest_framework import serializers

from states.models import State, HistoricalPopulation

class StateSerializer(serializers.ModelSerializer):
	class Meta:
		model = State
		fields = '__all__'

class HistoricalPopulationSerializer(serializers.ModelSerializer):
	state_name = serializers.ReadOnlyField()
	class Meta:
		model = HistoricalPopulation
		fields = '__all__'