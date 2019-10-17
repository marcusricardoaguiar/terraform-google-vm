#!/bin/bash

sudo -H apt-get install python3-pip -y
sudo -H pip3 install virtualenv
mkdir pyrest
virtualenv pyrest/
cd pyrest
source bin/activate
bin/pip3 install flask
gsutil cp gs://marcussantos-scripts/hello.py .
bin/python3 hello.py
