#!/usr/bin/python3
import sys
from operator import itemgetter

current_word = None
first = False
word = None
data = []
for line in sys.stdin:
	line = line.strip()
	word = line.split('\t');
	if first == False:
		current_word = word[0];
		data += [tuple(word[1].split(','))];
		first = True;
		continue

	if current_word == word[0]:
		data += [tuple(word[1].split(','))];
	else:
		data = sorted(data, key=lambda x: x[0])
		print(current_word, end='\t', flush=True)
		print('{0},{1},{2}'.format(data[0][0],data[0][1],data[0][2]), end='')
		for t in data[1::]:
			print(',{0},{1},{2}'.format(t[0],t[1],t[2]), end='', flush=True)
		print('', end='\n', flush=True)
		current_word = word[0];
		data = [tuple(word[1].split(','))]

if current_word == word[0]:
	data = sorted(data, key=lambda x: x[0])
	print(current_word, end='\t', flush=True)
	print('{0},{1},{2}'.format(data[0][0],data[0][1],data[0][2]), end='')
	for t in data[1::]:
		print(',{0},{1},{2}'.format(t[0],t[1],t[2]), end='', flush=True)
	print("", end='\n', flush=True)
