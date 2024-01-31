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
