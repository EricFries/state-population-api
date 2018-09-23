from django.contrib import admin
from django.urls import path

from states.views import StateViewSet, HistoricalPopulationViewSet
from rest_framework.routers import DefaultRouter

urlpatterns = [
    path('admin/', admin.site.urls),
]

router = DefaultRouter()
router.register(r'states', StateViewSet, base_name='states')
router.register(r'historical_populations', HistoricalPopulationViewSet, base_name='historical_populations')
urlpatterns += router.urls