# IPython Notebook for Docker

## Description

This is a [Docker](https://www.docker.com/) image for setting up
[IPython Notebook](http://ipython.org/) with some useful extra libraries and
configuration. The complete Python environment will be set up for you.

Bundled libraries:

* [python-louvain](https://pypi.python.org/pypi/python-louvain)

## Installation

### Script

1. Run the install script `./install.sh`
2. Make a note of the container ID output by the script. This can be used to
   stop IPython (`docker stop <id>`) and start it again later
   (`docker start <id>`). On a clean terminal you will need to set the
   environment variables as per `boot2docker shellinit` before issuing any
   Docker commands

### Manual install

1. If Docker is not already installed, follow the
   [Mac installation instructions](https://docs.docker.com/installation/mac/)
   to set it up.
2. Initialize the VM: `boot2docker init`
3. Start the VM: `boot2docker up`
4. Set the environment variables as indicated in output of previous step
5. Determine the Docker VM interface IP: `bootdocker ip`
6. Build the Docker image: `docker build -t ipynb .`
7. Enter the following command to start IPython Notebook:
   `docker run -d -p 9321:8888 -v /path/to/notebooks:/notebooks ipynb`
   Make a note of the container ID output - this can be used to stop and
   start IPython Notebook as required
8. Docker will now be running at <VM_IP>:9321
9. Use `docker stop <id>` and `docker start <id>` to stop and start IPython
   Notebook
