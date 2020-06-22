#!/usr/bin/python3
import sys
from operator import itemgetter

curr_count = None;
output = []
for line in sys.stdin:
	line = line.strip()
	words = line.split(',')
	#(PPID1, bit1), (PPID2, bit2), count
	mycount = words[0].split("_")[0].strip()
	count = int(mycount);
	print("({0}, {1}), ({2}, {3}), {4}".format(
										words[1].strip(),
										words[2].strip(),
										words[3].strip(),
										words[4].strip(),
										count
											 ),
			flush=True
			)
