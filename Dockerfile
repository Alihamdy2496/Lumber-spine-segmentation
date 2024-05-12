# syntax = docker/dockerfile:1.2
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

RUN apt update && set -x    

RUN DEBIAN_FRONTEND=noninteractive apt install -y build-essential checkinstall cmake yasm git libgl1-mesa-glx xvfb pkg-config libgtk-3-dev \
libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
gfortran openexr libatlas-base-dev \
python3.10 python3.10-dev python3.10-gdbm python3-pip python3.10-distutils \
libtbb2 libtbb-dev libdc1394-dev libopenexr-dev \
libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev \
qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libfaac-dev libmp3lame-dev libtheora-dev \
libvorbis-dev libopencore-amrnb-dev \
x264 v4l-utils libprotobuf-dev protobuf-compiler libgoogle-glog-dev \
libgflags-dev libgphoto2-dev libeigen3-dev libhdf5-dev doxygen \
wget curl libgl1 libnlopt-dev x11-apps x11-utils sudo

#RUN sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-plain-generic -y

RUN pip3 install torch torchvision

RUN pip3 install numpy

RUN pip3 install scipy matplotlib pandas

RUN pip3 install -U scikit-image

RUN pip3 install jupyterlab notebook-as-pdf

RUN pip3 install scikit-learn

RUN pip3 install scipy

RUN pip3 install SimpleITK

ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/compat

WORKDIR /workspaces/CIT646WorkSpace/
