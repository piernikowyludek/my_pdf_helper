FROM ubuntu:20.04  # alternative python:3.10.1-alpine3.14

# Making apt-get installation non-interactive
ARG DEBIAN_FRONTEND=noninteractive

# Installing Python, Jupyter, dependences
RUN apt-get update && apt-get install software-properties-common -y \
 && add-apt-repository ppa:deadsnakes/ppa && apt-get update \
 && apt-get install python3.9 python3-pip -y \
 && update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1 \
 && python -m pip install -U pip numpy pandas matplotlib seaborn sklearn \
 && rm -rf /var/lib/apt/lists/* && apt-get autoclean -y

# Installing the Python & Jupyter
#RUN     apt-get -q -y update \
#        && apt-get install -y software-properties-common \
#        && add-apt-repository ppa:deadsnakes/ppa \
#        && apt-get update && apt-get install -y python3.8 python3-pip \
#        && update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 \
#        && python -m pip install -U pip matplotlib jupyter librosa==0.8.0 numpy pandas pymoo pandas_bokeh cufflinks pip bokeh==2.4.3\
#	    && apt update && apt install -y sudo && sudo apt-get install -y libsndfile1-dev\
#	    && apt update && apt install -y python3-tk\
#        && rm -rf /var/lib/apt/lists/* && apt-get autoclean -y

 # Adding the configuration file
ADD jupyter_config.py /root/.jupyter/jupyter_notebook_config.py

# tar -czvf jupyterproject.tar.gz Dockerfile config.py
