#!/usr/bin/env python3

import sys
d = {}
for line in sys.stdin:
	line = line.strip()
	words = line.split('\t',1)
	print(words[1], flush=True)

