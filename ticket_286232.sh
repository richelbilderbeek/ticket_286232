#!/bin/bash
module load Tkinter/3.9.6-GCCcore-11.2.0
pip3 install --user --force-reinstall boldigger_cline
~/.local/bin/boldigger-cline --version
