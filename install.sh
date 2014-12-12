#!/bin/bash

# constants
default_path="$HOME/notebooks"
default_port="9697"

# check if boot2docker is installed
echo "Checking for boot2docker installation...."
command -v boot2docker > /dev/null 2>&1 || {
  echo >&2 "boot2docker is required but it's not installed."
  echo >&2 "Please follow the installation instructions here: https://docs.docker.com/installation/mac/"
  echo >&2 "Aborting.."
  exit 1
}

# initialise the boot2docker vm
echo "boot2docker found! Initialising the boot2docker VM..."
boot2docker init

# start the boot2docker vm
echo "Starting the boot2docker VM..."
boot2docker up

# set the required environment variables
export_output=$(boot2docker shellinit 2> /dev/null)
eval $export_output

# build the docker image
echo "Building the docker image..."
docker build -t ipynb .

# prompt the user for a custom path and port.
# I could write a function for this, but nah.
read -p "Please enter notebooks path [$default_path]: " input_path
if [[ $input_path = "" ]]; then
  input_path=$default_path
fi
read -p "Please enter the port number [$default_port]: " input_port
if [[ $input_port = "" ]]; then
  input_port=$default_port
fi

# run IPython Notebook
docker run -d -p $input_port:8888 -v $input_path:/notebooks ipynb

# get the IP
ip=$(boot2docker ip 2> /dev/null)
echo
echo "IPython Notebook is available from http://$ip:$input_port"
echo "Container ID: $(docker ps | awk 'NR==2 { print $1; }')"
open http://$ip:$input_port



