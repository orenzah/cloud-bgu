#!/usr/bin/env python3

import sys
for line in sys.stdin:
	line = line.strip()
	words = line.split('),(')
	if words[2].split(',')[1] == ' 1)':
		print('{0}),({1})'.format(words[0], words[1]), end='\t\n', flush=True)

