# soil

ROOT environment setup

# usage

The program `setup.sh` installs ROOT dependencies and a version of ROOT.

The program `soil.sh` sets up ROOT and PyROOT environment variables. It should be at the same directory as the directory "root" and sourced.

This program has been tested with the following ROOT versions:

- 5.34.18
- 6.00.00
- 6.01.02
- 6.03.01
- 6.07.07
- 6.08.00
- 6.08.02

---

# compile ROOT 6.16.00 with Python 3 and JupyROOT for Ubuntu 18.04 LTS

```Bash
mkdir -p ~/ROOT/root_v6.16.00
cd ~/ROOT/root_v6.16.00
wget https://root.cern.ch/download/root_v6.16.00.source.tar.gz
tar -xvf root_v6.16.00.source.tar.gz
rm root_v6.16.00.source.tar.gz

mkdir root
cd root
cmake ../root-6.16.00/ -DPYTHON_EXECUTABLE=/usr/bin/python3 -Dpython3=ON
time cmake --build . -- -j"$(nproc)"
# 2019-05-16T1850Z 27m40.939s

cmake ../root_v6.16.00.Linux-ubuntu16-x86_64-gcc5.4 -DPYTHON_EXECUTABLE=/usr/bin/python3 -Dpython3=ON

sudo su
source /home/user/ROOT/root_v6.16.00/root/bin/thisroot.sh

git clone git://github.com/rootpy/root_numpy.git
cd root_numpy
python3 setup.py install
cd ..
rm -rf root_numpy
pip3 install root_pandas
```
