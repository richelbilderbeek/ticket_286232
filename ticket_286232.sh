#!/bin/bash
#
# This solution has been confirmed by a user to work.
#
module load bioinfo-tools
module load wrf-python/1.3.1
module load Tkinter/3.9.6-GCCcore-11.2.0
pip3 install --user --force-reinstall boldigger_cline
~/.local/bin/boldigger-cline --version
