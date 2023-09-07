# syntax=docker/dockerfile:1
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y && useradd -m docker

RUN apt install -y curl wget build-essential git sudo
RUN apt install -y python3 python3-venv python3-dev python3-pip
RUN apt install -y lsb-release software-properties-common gnupg
RUN apt install -y cmake ninja-build
RUN apt install -y libboost-all-dev

# Install doxygen
RUN sudo apt-get install -y -qq doxygen graphviz

RUN echo 'docker ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER docker

WORKDIR /home/docker

RUN pip install -U jupyter-book sphinx_proof matplotlib numpy

