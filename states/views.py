from decimal import Decimal, ROUND_UP

from django.db.models import Sum
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.exceptions import NotFound

from states.models import State, HistoricalPopulation
from states.serializers import StateSerializer, HistoricalPopulationSerializer
from states.utils import quantize_decimal


class StateViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = State.objects.all()
    serializer_class = StateSerializer


class HistoricalPopulationViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = HistoricalPopulationSerializer

    def get_queryset(self):
        queryset = HistoricalPopulation.objects.all()

        # For now exclude Puerto Rico & DC since they aren't states (YET!)
        queryset = queryset \
            .exclude(state__name='District of Columbia') \
            .exclude(state__name='Puerto Rico')

        state_name_filter = self.request.query_params.get('state')
        if state_name_filter:
            queryset = queryset.filter(state__name=state_name_filter)

        year_filter = self.request.query_params.get('year')
        if year_filter:
            try:
                year_filter = int(year_filter)
            except ValueError:
                pass
            else:
                queryset = queryset.filter(year=year_filter)

        return queryset

    @action(detail=False, methods=['get'])
    def max_min_groups(self, request):
        queryset = self.get_queryset()
        year_filter = self.request.query_params.get('year')
        # get_queryset will have already appled the year filter.
        # However, this endpoint requires a year filter
        # (unlike the regular list) so if it is missing, raise an exception.
        if not year_filter:
            raise NotFound('A year query paramater is required for this endpoint.')

        queryset = queryset.order_by('-population')
        max_population_group = queryset[:25]
        max_population_sum = max_population_group.aggregate(
            Sum('population')).get('population__sum')
        min_population_group = queryset[25:]
        min_population_sum = min_population_group.aggregate(
            Sum('population')).get('population__sum')
        total_population = min_population_sum + max_population_sum

        max_states_percentage = quantize_decimal(
            Decimal(max_population_sum) / total_population * 100,
            rounding_option=ROUND_UP)
        min_states_percentage = quantize_decimal(
            Decimal(min_population_sum) / total_population * 100)

        data = {
            'max_states':  self.get_serializer(
                max_population_group, many=True).data,
            'min_states': self.get_serializer(
                min_population_group, many=True).data,
            'total_population': total_population,
            'max_states_percentage': max_states_percentage,
            'min_states_percentage': min_states_percentage,
        }

        return Response(data)
