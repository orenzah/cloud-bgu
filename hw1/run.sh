#!/bin/bash
. parse_yaml.sh
eval $(parse_yaml config.yaml)
if [[ "$TRANSPORT" == "UDP" ]]; then
	RPID=$(ssh root@$REMOTE_IP "iperf3 -s -u -p $PORT > iperf3.txt & echo -e \$!")
	iperf3 -u -c $REMOTE_IP -p $PORT -t $TIME -i $INTERVAL --forceflush | tee $OUTPUT_FILE
else
	RPID=$(ssh root@$REMOTE_IP "iperf3 -s -p $PORT > iperf3.txt & echo -e \$!")
	iperf3 -c $REMOTE_IP -p $PORT -t $TIME -i $INTERVAL --forceflush | tee $OUTPUT_FILE

fi
ssh root@$REMOTE_IP "kill -9 $RPID"





