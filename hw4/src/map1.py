#!/usr/bin/env python3

import sys
for line in sys.stdin:
    line = line.strip()
    words = line.split(',')
    print(words[1], end='\t', flush=False)
    print('{0},{1},{2}'.format(words[0], words[2], words[3]), flush=True)

