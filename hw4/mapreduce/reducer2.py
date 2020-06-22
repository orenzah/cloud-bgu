#!/usr/bin/python3
import sys
from operator import itemgetter

word = None
data = []
for line in sys.stdin:
	line = line.strip()
	words= line.split(',');
	cnt = 0;
	count = len(words)
	if count < 9:
		print('({0},{1})'.format(words[1], 0), end='')
		for i in range(1, int(count / 3)):
			print(',({0},{1})'.format(words[i*3 + 1], 0), end='')
			cnt += 1;
		for i in range(2-cnt):
			print(',({0},{1})'.format(words[-2], 0), end='')
		print('', flush=True)
	else:
		tups = int(count / 3);
		for i in range(2, tups):
			print( '({0}, {1})'.format(words[(i-2)*3 + 1], words[(i-2)*3 + 2]), end='')
			print(',({0}, {1})'.format(words[(i-1)*3 + 1], words[(i-1)*3 + 2]), end='')
			print(',({0}, {1})'.format(words[(i-0)*3 + 1], words[(i-0)*3 + 2]), end='\n', flush=True)

