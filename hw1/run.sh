#!/bin/bash
. parse_yaml.sh
eval $(parse_yaml config.yaml)
RPID=$(ssh root@$REMOTE_IP "iperf3 -s -p $PORT > iperf3.txt & echo -e \$!")
if [[ "$TRANSPORT" == "UDP" ]]; then
	iperf3 -u -c $REMOTE_IP -p $PORT -t $TIME -i $INTERVAL --forceflush | tee $OUTPUT_FILE
else
	iperf3 -c $REMOTE_IP -p $PORT -t $TIME -i $INTERVAL --forceflush | tee $OUTPUT_FILE

fi
ssh root@$REMOTE_IP "kill -9 $RPID"





