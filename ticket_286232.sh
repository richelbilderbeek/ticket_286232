#!/bin/bash


# The first line of boldigger-cline uses this version:
# #!/sw/comp/python3/3.11.4/rackham/bin/python3.11

# Fails: results in Python 3.6.6
# module load bioinfo-tools python3/3.11.4 wrf-python/1.3.1 

module load bioinfo-tools python3/3.11.4 python_ML_packages/3.9.5-gpu Tkinter/3.8.6-GCCcore-10.2.0

# module load bioinfo-tools python3/3.11.4 Tkinter/3.9.6-GCCcore-11.2.0
# wrf-python/1.3.1

pip3 install boldigger_cline
python3 --version
#pip3 install --upgrade pip
#pip3 install packaging
python3 --version
~/.local/bin/boldigger-cline --version

# boldigger-cline --version


#[richel@rackham2 ~]$ module load bioinfo-tools python3/3.11.4
#[richel@rackham2 ~]$ python3 --version
#Python 3.11.4
#[richel@rackham2 ~]$ module load wrf-python/1.3.1
#[richel@rackham2 ~]$ python3 --version
#Python 3.6.6
