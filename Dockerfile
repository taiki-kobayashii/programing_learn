FROM ubuntu:20.04

# SHELL ["/bin/bash", "-c"]

# Timezone, Launguage設定
ENV TZ=Asia/Tokyo
RUN apt update \
  && apt install -y --no-install-recommends \
     locales \
     sudo \
     software-properties-common \
     tzdata \
     nano \
  && locale-gen en_US en_US.UTF-8 \
  && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
  && add-apt-repository universe


# Install ROS2
RUN apt update \
  && apt install -y --no-install-recommends \
     curl \
     gnupg2 \
     lsb-release \
     python3-pip \
     vim \
     wget \
     build-essential \
     ca-certificates

RUN add-apt-repository ppa:kisak/kisak-mesa \
  && apt update \
  && apt install -y software-properties-common \
  && apt install -y \
     libegl-mesa0 \
     libegl1-mesa-dev \
     libgbm-dev \
     libgbm1 \
     libgl1-mesa-dev \
     libgl1-mesa-dri \
     libglapi-mesa \
     libglx-mesa0

# Install java
RUN apt update && \
    apt install -y openjdk-17-jdk
RUN echo 'JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")' >> ~/.bashrc
RUN echo 'export JAVA_HOME' >> ~/.bashrc
RUN echo 'PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
RUN echo 'export PATH' >> ~/.bashrc
#pathを読み込んで処理
RUN . ~/.bashrc

# Install gcc & g++
RUN apt install -y build-essential


RUN mkdir share_dir \
    && cd share_dir

WORKDIR share_dir
