#!/usr/bin/env bash

# ------------------------------------------
# Add Envimental Setup for Aliases
# ------------------------------------------
echo 'Add Envimental Setup for Aliases'

if [ ! -f ~/.alias_init ]
then
    echo "source /.alias" >> ~/.bashrc
    echo "Welcome to WAU system" >> ~/.alias_init
fi

# ------------------------------------------
# Start Flesk Server if Exists
# ------------------------------------------
echo 'Flesh Start'

if [  -f /opt/classificator/server.py ]; then
	if ! screen -list | grep -q "flesk_server"; then
		echo "screen -d -m -S flesk_server bash -c 'export FLASK_APP=/opt/classificator/server.py;flask run  --host=0.0.0.0 --port 5002'"
	    screen -d -m -S flesk_server bash -c 'export FLASK_APP=/opt/classificator/server.py;flask run  --host=0.0.0.0 --port 5002'
	else
	    echo "flesk is already runing"
	fi
fi

if [  -f /opt/classificator/start.sh ]; then
	screen -d -m -S project_start_sh bash -c '/opt/classificator/start.sh'
fi

if ! screen -list | grep -q "jupyter"; then
	echo "screen -d -m -S jupyter bash -c 'jupyter notebook --allow-root'"
    screen -d -m -S jupyter bash -c 'jupyter notebook --allow-root'
else
    echo "flesk is already runing"
fi



tail -F -n0 /etc/hosts
