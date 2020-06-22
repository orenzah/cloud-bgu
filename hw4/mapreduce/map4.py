#!/usr/bin/env python3
def comp1(s, c):
    l = list(s);
    for i in range(len(l)):
        l[i] = '{0}'.format(c - int(l[i]))
    return ''.join(l) + str(5 - len(l))

def comp(s):
	le1 = len(s);
	s = s.ljust(5, '0')
	l = list(s);
	#l.reverse()
	for i in range(len(l)):
		l[i] = str(9 - int(l[i]))
	return ''.join(l) + str(6 - le1)

import sys
for line in sys.stdin:
	line = line.strip()
	words = line.split(',')
	count = int(words[-1].strip())
	cnt_w = '{0}'.format(count).rjust(5, '0')
	print(cnt_w, end='_')
	ppid1 = words[0].strip().replace('(' , '').replace(')' , '')
	bit1 = words[1].strip().replace('(' , '').replace(')' , '').strip()
	ppid2 = words[2].strip().replace('(' , '').replace(')' , '')
	bit2 = words[3].strip().replace('(' , '').replace(')' , '').strip()
	ppid1 = comp(ppid1)
	bit1 = comp1(bit1, 1)
	ppid2 = comp(ppid2)
	bit2 = comp1(bit2,1)
	print(ppid1, end='')
	print(bit1, end='_')
	print(ppid2, end='')
	print(bit2, end=',')
	print(line[-3::-1][::-1].replace('(' ,'').replace(')',''), flush=True)
