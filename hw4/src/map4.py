#!/usr/bin/env python3
def comp(s, c):
    l = list(s);
    for i in range(len(l)):
        l[i] = '{0}'.format(c - int(l[i]))
    return ''.join(l) + str(5 - len(l))
import sys
for line in sys.stdin:
	line = line.strip()
	words = line.split(',')
	print(int(words[-1].strip()), end='_')
	ppid1 = words[0].strip().replace('(' , '').replace(')' , '')
	bit1 = words[1].strip().replace('(' , '').replace(')' , '').strip()
	ppid2 = words[2].strip().replace('(' , '').replace(')' , '')
	bit2 = words[3].strip().replace('(' , '').replace(')' , '').strip()
	ppid1 = comp(ppid1, 9)
	bit1 = comp(bit1, 1)
	ppid2 = comp(ppid2, 9)
	bit2 = comp(bit2,1)
	print(ppid1.rjust(5,ppid1[0]), end='')
	print(bit1, end='_')
	print(ppid2.rjust(5,ppid2[0]), end='')
	print(bit2, end=',')
	print(line[-3::-1][::-1].replace('(' ,'').replace(')',''), flush=True)
