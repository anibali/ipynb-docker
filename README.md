# IPython Notebook for Docker

## Description

This is a [Docker](https://www.docker.com/) image for setting up
[IPython Notebook](http://ipython.org/) with some useful extra libraries and
configuration. The complete Python environment will be set up for you.

Bundled libraries:

* [python-louvain](https://pypi.python.org/pypi/python-louvain)

## Mac OS Installation

### Script

1. Clone this repository and change directory into ipynb-docker
2. Run the install script `./install.sh`
3. Make a note of the container ID output by the script. This can be used to
   stop IPython (`docker stop <id>`) and start it again later
   (`docker start <id>`). Please note that you will need to set the
   environment variables as per `boot2docker shellinit` before issuing any
   Docker commands

### Manual install

1. If Docker is not already installed, follow the
   [Mac installation instructions](https://docs.docker.com/installation/mac/)
   to set it up.
2. Initialize and start the VM: `boot2docker init && boot2docker up`
3. Set the environment variables as indicated in the output of previous step
4. Clone this repository and change directory into ipynb-docker
5. Build the Docker image: `docker build -t ipynb .`
6. Run IPython Notebook:
   `docker run -d -p 9321:8888 -v /path/to/notebooks:/notebooks ipynb`
   Make a note of the container ID output - this can be used to stop and
   start IPython Notebook as required
7. Docker will now be running at VM_IP:9321, where VM_IP is the IP address
   output by `boot2docker ip`
8. Use `docker stop <id>` and `docker start <id>` to stop and start IPython
   Notebook
