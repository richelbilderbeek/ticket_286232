# ticket_286232

Ticket 286232

```bash title="~/.local/bin/boldigger-cline"
[richel@rackham2 ticket_286232]$ cat ~/.local/bin/boldigger-cline
#!/sw/comp/python3/3.11.4/rackham/bin/python3.11
# -*- coding: utf-8 -*-
import re
import sys
from boldigger_cline.__main__ import main
if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit(main())
```

## Approach 1: `bioinfo-tools python3/3.6.8 wrf-python/1.3.1` 

This fails, as for the version of Python loaded by `wrf-python/1.3.1`
(which is Python 3.6.6), there existed no version of `cssselect` yet (`1.1` is latest)
that is required for `boldigger_cline` (which requires `1.2`).

### Attempt 1: basic setup

```
module load bioinfo-tools python3/3.6.8 
python3 --version # Will be 3.6.8
module load wrf-python/1.3.1 
python3 --version # Will be 3.6.6 after loading wrf-python/1.3.1 
pip3 install boldigger_cline
```

Error:

```
Collecting cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
  Could not find a version that satisfies the requirement cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline) (from versions: 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.6.1, 0.7, 0.7.1, 0.8, 0.9, 0.9.1, 0.9.2, 1.0.0, 1.0.1, 1.0.3, 1.1.0)
No matching distribution found for cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
```

### Attempt 2: `install --user cssselect>=1.2.0`

Then:

```
pip3 install --user cssselect>=1.2.0
```

Works!

Again:

```
pip3 install boldigger_cline
```

Fails again with:

```
  Using cached https://files.pythonhosted.org/packages/3b/00/2344469e2084fb287c2e0b57b72910309874c3245463acd6cf5e3db69324/appdirs-1.4.4-py2.py3-none-any.whl
Collecting cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
  Could not find a version that satisfies the requirement cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline) (from versions: 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.6.1, 0.7, 0.7.1, 0.8, 0.9, 0.9.1, 0.9.2, 1.0.0, 1.0.1, 1.0.3, 1.1.0)
No matching distribution found for cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
```

### Attempt 3: `pip3 install --user boldigger_cline`

Now using `--user` explicitly:

```
pip3 install --user boldigger_cline
```

Again fails again with:

```
  Using cached https://files.pythonhosted.org/packages/56/37/29d137df23ed1d88d8dcee8a6b8e789d1162042f194b5ccd0a48f503429b/pyee-8.2.2-py2.py3-none-any.whl
Collecting cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
  Could not find a version that satisfies the requirement cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline) (from versions: 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.6.1, 0.7, 0.7.1, 0.8, 0.9, 0.9.1, 0.9.2, 1.0.0, 1.0.1, 1.0.3, 1.1.0)
No matching distribution found for cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
```

### Attempt 4: `--force-reinstall` on `boldigger_cline`


Now using `--force-reinstall` explicitly (from [StackOverflow](https://stackoverflow.com/a/5226504)):

```
pip3 install --user --force-reinstall boldigger_cline
```

Gives:

```
  Using cached https://files.pythonhosted.org/packages/a0/a1/b153a0a4caf7a7e3f15c2cd56c7702e2cf3d89b1b359d1f1c5e59d68f4ce/importlib_metadata-4.8.3-py3-none-any.whl
Collecting cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
  Could not find a version that satisfies the requirement cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline) (from versions: 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.6.1, 0.7, 0.7.1, 0.8, 0.9, 0.9.1, 0.9.2, 1.0.0, 1.0.1, 1.0.3, 1.1.0)
No matching distribution found for cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
```

### Attempt 5: `--force-reinstall` on `cssselect`


Now using `--force-reinstall` explicitly (from [StackOverflow](https://stackoverflow.com/a/5226504)):

```
pip3 install --user --force-reinstall cssselect>=1.2
```

Works!

Then:

```
pip3 install --user --force-reinstall boldigger_cline
```


Gives:

```
  Using cached https://files.pythonhosted.org/packages/bd/df/d4a4974a3e3957fd1c1fa3082366d7fff6e428ddb55f074bf64876f8e8ad/zipp-3.6.0-py3-none-any.whl
Collecting cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
  Could not find a version that satisfies the requirement cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline) (from versions: 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.6.1, 0.7, 0.7.1, 0.8, 0.9, 0.9.1, 0.9.2, 1.0.0, 1.0.1, 1.0.3, 1.1.0)
No matching distribution found for cssselect>=1.2.0 (from pyquery->requests-html>=0.10.0->boldigger>=2.2.0->boldigger_cline)
```

Indeed the version is still too low:

```
[richel@rackham3 ticket_286232]$ pip3 freeze | grep cssselect
cssselect==1.1.0
```

### Attempt 6: put selection `cssselect>=1.2.0` in quotes

```
[richel@rackham3 ticket_286232]$ pip3 install --user --force-reinstall "cssselect>=1.2.0"
Collecting cssselect>=1.2.0
  Could not find a version that satisfies the requirement cssselect>=1.2.0 (from versions: 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.6.1, 0.7, 0.7.1, 0.8, 0.9, 0.9.1, 0.9.2, 1.0.0, 1.0.1, 1.0.3, 1.1.0)
No matching distribution found for cssselect>=1.2.0
```

I feel this approach is a dead end in dependency hell.

## Approach 2: `Tkinter/3.9.6-GCCcore-11.2.0`

```
#!/bin/bash
module load Tkinter/3.9.6-GCCcore-11.2.0
pip3 install --user --force-reinstall boldigger_cline
~/.local/bin/boldigger-cline --version
```

### Setup

```
[richel@rackham3 ticket_286232]$ module load Tkinter/3.9.6-GCCcore-11.2.0
[richel@rackham3 ticket_286232]$ python3 --version
Python 3.9.6
```

```
pip3 install --user --force-reinstall boldigger_cline
```

Gives:

```
[richel@rackham3 ticket_286232]$ pip3 install --user --force-reinstall boldigger_cline
Collecting boldigger_cline
  Using cached boldigger_cline-2.2.1-py3-none-any.whl (16 kB)
Collecting tqdm>=4.32.2
  Using cached tqdm-4.66.1-py3-none-any.whl (78 kB)
Collecting boldigger>=2.2.0
  Using cached boldigger-2.2.0-py3-none-any.whl (54 kB)
Collecting lxml>=4.3.3
  Downloading lxml-5.1.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (8.0 MB)
     |████████████████████████████████| 8.0 MB 12.7 MB/s 
Collecting joblib>=1.1.0
  Using cached joblib-1.3.2-py3-none-any.whl (302 kB)
Collecting tables>=3.7.0
  Downloading tables-3.9.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (7.5 MB)
     |████████████████████████████████| 7.5 MB 66.0 MB/s 
Collecting numpy>=1.16.4
  Downloading numpy-1.26.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (18.2 MB)
     |████████████████████████████████| 18.2 MB 67.3 MB/s 
Collecting more-itertools>=7.2.0
  Downloading more_itertools-10.2.0-py3-none-any.whl (57 kB)
     |████████████████████████████████| 57 kB 7.2 MB/s 
Collecting html5lib>=1.0.1
  Using cached html5lib-1.1-py2.py3-none-any.whl (112 kB)
Collecting requests-html>=0.10.0
  Using cached requests_html-0.10.0-py3-none-any.whl (13 kB)
Collecting beautifulsoup4>=4.7.1
  Using cached beautifulsoup4-4.12.3-py3-none-any.whl (147 kB)
Collecting biopython>=1.78
  Downloading biopython-1.83-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (3.1 MB)
     |████████████████████████████████| 3.1 MB 64.0 MB/s 
Collecting openpyxl>=2.6.2
  Using cached openpyxl-3.1.2-py2.py3-none-any.whl (249 kB)
Collecting pandas>=0.25.0
  Downloading pandas-2.2.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (13.0 MB)
     |████████████████████████████████| 13.0 MB 66.3 MB/s 
Collecting requests>=2.22.0
  Downloading requests-2.31.0-py3-none-any.whl (62 kB)
     |████████████████████████████████| 62 kB 412 kB/s 
Collecting luddite>=1.0.1
  Using cached luddite-1.0.3-py2.py3-none-any.whl (9.7 kB)
Collecting PySimpleGUI>=4.18.2
  Using cached PySimpleGUI-4.60.5-py3-none-any.whl (512 kB)
Collecting psutil>=5.8.0
  Using cached psutil-5.9.8-cp36-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (288 kB)
Collecting xlrd>=1.2.0
  Using cached xlrd-2.0.1-py2.py3-none-any.whl (96 kB)
Collecting soupsieve>1.2
  Using cached soupsieve-2.5-py3-none-any.whl (36 kB)
Collecting six>=1.9
  Using cached six-1.16.0-py2.py3-none-any.whl (11 kB)
Collecting webencodings
  Using cached webencodings-0.5.1-py2.py3-none-any.whl (11 kB)
Collecting packaging
  Using cached packaging-23.2-py3-none-any.whl (53 kB)
Collecting et-xmlfile
  Using cached et_xmlfile-1.1.0-py3-none-any.whl (4.7 kB)
Collecting tzdata>=2022.7
  Downloading tzdata-2023.4-py2.py3-none-any.whl (346 kB)
     |████████████████████████████████| 346 kB 75.5 MB/s 
Collecting pytz>=2020.1
  Using cached pytz-2023.4-py2.py3-none-any.whl (506 kB)
Collecting python-dateutil>=2.8.2
  Using cached python_dateutil-2.8.2-py2.py3-none-any.whl (247 kB)
Collecting urllib3<3,>=1.21.1
  Downloading urllib3-2.2.0-py3-none-any.whl (120 kB)
     |████████████████████████████████| 120 kB 74.8 MB/s 
Collecting idna<4,>=2.5
  Using cached idna-3.6-py3-none-any.whl (61 kB)
Collecting charset-normalizer<4,>=2
  Downloading charset_normalizer-3.3.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (142 kB)
     |████████████████████████████████| 142 kB 74.6 MB/s 
Collecting certifi>=2017.4.17
  Using cached certifi-2023.11.17-py3-none-any.whl (162 kB)
Collecting w3lib
  Using cached w3lib-2.1.2-py3-none-any.whl (21 kB)
Collecting pyquery
  Using cached pyquery-2.0.0-py3-none-any.whl (22 kB)
Collecting fake-useragent
  Using cached fake_useragent-1.4.0-py3-none-any.whl (15 kB)
Collecting parse
  Using cached parse-1.20.1-py2.py3-none-any.whl (20 kB)
Collecting bs4
  Using cached bs4-0.0.2-py2.py3-none-any.whl (1.2 kB)
Collecting pyppeteer>=0.0.14
  Using cached pyppeteer-1.0.2-py3-none-any.whl (83 kB)
Collecting pyee<9.0.0,>=8.1.0
  Using cached pyee-8.2.2-py2.py3-none-any.whl (12 kB)
Collecting appdirs<2.0.0,>=1.4.3
  Using cached appdirs-1.4.4-py2.py3-none-any.whl (9.6 kB)
Collecting websockets<11.0,>=10.0
  Downloading websockets-10.4-cp39-cp39-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (106 kB)
     |████████████████████████████████| 106 kB 59.3 MB/s 
Collecting urllib3<3,>=1.21.1
  Using cached urllib3-1.26.18-py2.py3-none-any.whl (143 kB)
Collecting importlib-metadata>=1.4
  Downloading importlib_metadata-7.0.1-py3-none-any.whl (23 kB)
Collecting zipp>=0.5
  Downloading zipp-3.17.0-py3-none-any.whl (7.4 kB)
Collecting blosc2>=2.3.0
  Downloading blosc2-2.5.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (4.4 MB)
     |████████████████████████████████| 4.4 MB 65.5 MB/s 
Collecting py-cpuinfo
  Using cached py_cpuinfo-9.0.0-py3-none-any.whl (22 kB)
Collecting numexpr>=2.6.2
  Downloading numexpr-2.9.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (374 kB)
     |████████████████████████████████| 374 kB 51.5 MB/s 
Collecting ndindex>=1.4
  Downloading ndindex-1.7-py3-none-any.whl (85 kB)
     |████████████████████████████████| 85 kB 5.9 MB/s 
Collecting msgpack
  Downloading msgpack-1.0.7-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (530 kB)
     |████████████████████████████████| 530 kB 47.3 MB/s 
Collecting importlib-resources>=5.0
  Using cached importlib_resources-6.1.1-py3-none-any.whl (33 kB)
Collecting cssselect>=1.2.0
  Using cached cssselect-1.2.0-py2.py3-none-any.whl (18 kB)
Installing collected packages: zipp, soupsieve, websockets, urllib3, tqdm, six, pyee, py-cpuinfo, numpy, ndindex, msgpack, lxml, importlib-resources, importlib-metadata, idna, cssselect, charset-normalizer, certifi, beautifulsoup4, appdirs, webencodings, w3lib, tzdata, requests, pytz, python-dateutil, pyquery, pyppeteer, parse, packaging, numexpr, fake-useragent, et-xmlfile, bs4, blosc2, xlrd, tables, requests-html, PySimpleGUI, psutil, pandas, openpyxl, more-itertools, luddite, joblib, html5lib, biopython, boldigger, boldigger-cline
  WARNING: The script tqdm is installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script cpuinfo is installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script f2py is installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script normalizer is installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script pyppeteer-install is installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The scripts pt2to3, ptdump, ptrepack and pttree are installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script luddite is installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script boldigger is installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script boldigger-cline is installed in '/home/richel/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
poetry 1.1.7 requires packaging<21.0,>=20.4, but you have packaging 23.2 which is incompatible.
Successfully installed PySimpleGUI-4.60.5 appdirs-1.4.4 beautifulsoup4-4.12.3 biopython-1.83 blosc2-2.5.1 boldigger-2.2.0 boldigger-cline-2.2.1 bs4-0.0.2 certifi-2023.11.17 charset-normalizer-3.3.2 cssselect-1.2.0 et-xmlfile-1.1.0 fake-useragent-1.4.0 html5lib-1.1 idna-3.6 importlib-metadata-7.0.1 importlib-resources-6.1.1 joblib-1.3.2 luddite-1.0.3 lxml-5.1.0 more-itertools-10.2.0 msgpack-1.0.7 ndindex-1.7 numexpr-2.9.0 numpy-1.26.3 openpyxl-3.1.2 packaging-23.2 pandas-2.2.0 parse-1.20.1 psutil-5.9.8 py-cpuinfo-9.0.0 pyee-8.2.2 pyppeteer-1.0.2 pyquery-2.0.0 python-dateutil-2.8.2 pytz-2023.4 requests-2.31.0 requests-html-0.10.0 six-1.16.0 soupsieve-2.5 tables-3.9.2 tqdm-4.66.1 tzdata-2023.4 urllib3-1.26.18 w3lib-2.1.2 webencodings-0.5.1 websockets-10.4 xlrd-2.0.1 zipp-3.17.0
WARNING: You are using pip version 21.2.2; however, version 23.3.2 is available.
You should consider upgrading via the '/sw/EasyBuild/rackham/software/Python/3.9.6-GCCcore-11.2.0/bin/python3.9 -m pip install --upgrade pip' command.
[richel@rackham3 ticket_286232]$ ~/.local/bin/boldigger-cline --version
2.2.1
[richel@rackham3 ticket_286232]$ 
```

Test to work:

```
[richel@rackham3 ticket_286232]$ ~/.local/bin/boldigger-cline --version
2.2.1
```
