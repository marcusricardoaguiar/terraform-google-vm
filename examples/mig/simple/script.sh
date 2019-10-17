#!/bin/bash

sudo -H apt-get install python3-pip
sudo -H pip3 install virtualenv
mkdir pyrest
virtualenv pyrest/
cd pyrest
source bin/activate
bin/pip3 install flask
bin/python3 hello.py
