from rest_framework import serializers
from todo_python.models import Todo

class TodoSerializer(serializers.ModelSerializer):
	class Meta:
		model = Todo
