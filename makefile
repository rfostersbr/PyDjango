
HOME = .
PART = ../todo-part-two
PY = todo.vnv/bin/python
PYV = pyvenv
PPI = todo.vnv/bin/pip install
OPTS = bdist_wheel

.PHONY: build venv all clean

build: venv
	cp ./bower_components/angular/angular.min.js ./todo/todo_python/static/js
	cp ./bower_components/angular-ui/build/angular-ui.min.js ./todo/todo_python/static/js
	cp ./bower_components/angular-ui/build/angular-ui.min.css ./todo/todo_python/static/js
	$(PPI) wheel
	$(PY) setup.py bdist_wheel


venv:
	 pyvenv todo-test.vnv

all: venv build
	cp install.sh dist/install.sh
	./makeself.sh --nocomp --notemp --nox11 dist todo.run "todo-test-proj" ./install.sh

clean:
	sudo rm -rf  todo-test.vnv/*.whl  /opt/todo ./install.sh todo.run
	
