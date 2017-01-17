# Cyverse-iRODS-DEV
#
# VERSION	1.0

FROM	ubuntu:14.04
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

##############################################
# Setup an account
##############################################
ENV HOME /home/cyverse

RUN useradd cyverse && echo 'cyverse:cyverse' | chpasswd && \
    echo "cyverse ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir /home/cyverse && \
    chown -R cyverse:cyverse $HOME

ENV USER cyverse

##############################################
# Setup utility packages
##############################################
RUN apt-get update && \
    apt-get install -y wget curl unzip python-pip build-essential ssh fuse git && \
    usermod -aG fuse $USER

USER $USER
WORKDIR $HOME

##############################################
# Download cyverse-irods
##############################################
RUN git clone https://github.com/cyverse/cyverse-irods.git

WORKDIR cyverse-irods

##############################################
# Build cyverse-irods
##############################################
RUN git submodule init; git submodule update

USER root
RUN apt-get install -y python-dev help2man unixodbc libfuse-dev libcurl4-gnutls-dev \
                       libbz2-dev zlib1g-dev libpam0g-dev libssl-dev libxml2-dev \
                       libkrb5-dev libjson-perl python-psutil libjson-perl \
                       python-jsonschema libtool automake unixodbc-dev

USER $USER
RUN ./packaging/build.sh --run-in-place icat postgres

ENV PATH $PATH:$HOME/cyverse-irods/iRODS/clients/icommands/bin:$HOME/cyverse-irods/iRODS/clients/fuse/bin

WORKDIR $HOME
