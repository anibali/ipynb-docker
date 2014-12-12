# IPython Notebook for Docker

## Installation

1. If Docker is not already installed, follow the
   [Mac installation instructions](https://docs.docker.com/installation/mac/)
   to set it up.
2. Initialize the VM: `boot2docker init`
3. Start the VM: `boot2docker up`
4. Set the environment variables as indicated in output of previous step
5. Determine the Docker VM interface IP: `bootdocker ip`
4. Enter the following command to start IPython Notebook:
   `docker run -d -p 9321:8888 -v /path/to/notebooks:/notebooks ipynb`
   Make a note of the container ID output - this can be used to stop and
   start IPython Notebook as required
5. Docker will now be running at <VM_IP>:9321
6. Use `docker stop <id>` and `docker start <id>` to stop and start IPython
   Notebook
