#!/usr/bin/python3
import sys
from operator import itemgetter

current_line = None
first = False
word = None
data = []
count = 0;
for line in sys.stdin:
	line = line.strip()
	if current_line == line:
		count += 1
	else:
		if current_line:
			print('{0},{1}'.format(current_line, count), flush=True)
		count = 1
		current_line = line;

if current_line == line:
	print('{0},{1}'.format(current_line, count), flush=True)

