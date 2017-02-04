#!/bin/bash

echo "install Python 2.6"
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get -y install python2.6

echo "install ROOT prerequisites"
sudo apt-get -y install subversion
sudo apt-get -y install dpkg-dev
sudo apt-get -y install make
sudo apt-get -y install g++
sudo apt-get -y install gcc
sudo apt-get -y install binutils
sudo apt-get -y install libx11-dev
#sudo apt-get -y install libxpm-dev
sudo apt-get -y install libxft-dev
sudo apt-get -y install libxext-dev

echo "install optional ROOT packages"
sudo apt-get -y install gfortran
sudo apt-get -y openssl-dev
sudo apt-get -y install libssl-dev
#sudo apt-get -y install ncurses-dev
sudo apt-get -y install libpcre3-dev
sudo apt-get -y install xlibmesa-glu-dev
sudo apt-get -y install libglew1.5-dev
sudo apt-get -y install libftgl-dev
sudo apt-get -y install libmysqlclient-dev
sudo apt-get -y install libfftw3-dev
sudo apt-get -y install cfitsio-dev
sudo apt-get -y install graphviz-dev
sudo apt-get -y install libavahi-compat-libdnssd-dev
#sudo apt-get -y install libldap-dev
sudo apt-get -y install libldap2-dev
sudo apt-get -y install python-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libkrb5-dev
sudo apt-get -y install libgsl0-dev
sudo apt-get -y install libqt4-dev

filename="root_v6.08.00.Linux-ubuntu16-x86_64-gcc5.4.tar.gz"
echo "install ROOT"
wget https://root.cern.ch/download/"${filename}"
tar -xvf "${filename}"
rm "${filename}"
