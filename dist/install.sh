#!/bin/bash

if [ ! -e /opt/todo ]; then
  sudo mkdir /opt/todo
fi

sudo chown -R rfoster:rfoster /opt/todo
pyvenv /opt/todo
/opt/todo/bin/pip install ./todo*.whl
chmod 755 /opt/todo/lib/python/site-packages/todo/manage.py
/opt/todo/bin/python3.6 /opt/todo/lib/python3.6/site-packages/todo/manage.py migrate &
/opt/todo/bin/python3.6 /opt/todo/lib/python3.6/site-packages/todo/manage.py runserver &
