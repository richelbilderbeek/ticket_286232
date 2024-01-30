#!/bin/bash
#module load python3/3.11.4
#pip3 install boldigger_cline

# The first line of boldigger-cline uses this version:
# #!/sw/comp/python3/3.11.4/rackham/bin/python3.11

module load bioinfo-tools python3/3.11.4 wrf-python/1.3.1 
# Tk/8.6.11-GCCcore-11.2.0
# module load Tcl-Tk/8.6.11 Tkinter/3.9.6-GCCcore-11.2.0

python3 --version


./.local/bin/boldigger-cline --version

# boldigger-cline --version


#[richel@rackham2 ~]$ module load bioinfo-tools python3/3.11.4
#[richel@rackham2 ~]$ python3 --version
#Python 3.11.4
#[richel@rackham2 ~]$ module load wrf-python/1.3.1
#[richel@rackham2 ~]$ python3 --version
#Python 3.6.6

