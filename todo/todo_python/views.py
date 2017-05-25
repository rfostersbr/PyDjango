from django.shortcuts import render
from rest_framework import viewsets

from todo_python.models import Todo
from todo_python.serializers import TodoSerializer

# Todos routes
class TodoViewSet(viewsets.ModelViewSet):
	queryset = Todo.objects.all()
	serializer_class = TodoSerializer


# Home route
def index(request):
    return render(request, 'todo_python/base.html')
