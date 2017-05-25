#!/bin/bash

PRJ_NAME=''
INS=install.sh
RPL="n"

if [ -e $INS ]; then
  echo "$INS exists in the current directory, would you like to replace it? (y/n)"
  read RPL
  echo

  if [ "$RPL" == "y" -o "$RPL" == "Y" ]; then
    rm $INS
  elif [ "$RPL" == "n" -o "$RPL" == "N" ]; then
    echo "$INS will be overwritten..."
    echo
  else
    echo "Invalid selection"
    echo
  fi
fi

echo "Input the project name for the installer"
read PRJ_NAME
echo

HOME=/opt/$PRJ_NAME
LIB=$HOME/lib
BIN=$HOME/bin
PYT=$BIN/python3.4

echo "#!/bin/bash" > $INS
echo "" >> $INS

echo "if [ ! -e $HOME ]; then" >> $INS
echo "  sudo mkdir /opt/$PRJ_NAME" >> $INS
echo "fi" >> $INS
echo "" >> $INS

echo "sudo chown -R `whoami`:`whoami` /opt/$PRJ_NAME" >> $INS
echo "pyvenv-3.4 /opt/$PRJ_NAME" >> $INS
echo "$BIN/pip install ./$PRJ_NAME*.whl" >> $INS
echo "chmod 755 $LIB/python3.4/site-packages/$PRJ_NAME/manage.py" >> $INS
echo "$PYT $LIB/python3.4/site-packages/$PRJ_NAME/manage.py migrate &" >> $INS
echo "$PYT $LIB/python3.4/site-packages/$PRJ_NAME/manage.py runserver &" >> $INS

