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

## `bioinfo-tools python3/3.6.8 wrf-python/1.3.1` fails


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
