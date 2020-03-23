RPID=$(ssh root@$1 "iperf3 -s -p $2 > iperf3.txt & echo -e \$!")
iperf3 -c $1 -p $2-t $3 -i $4 --forceflush | tee $5
ssh root@$1 "kill -9 $RPID"





