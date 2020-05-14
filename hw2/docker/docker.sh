#!/bin/bash
. parse_yaml.sh
eval $(parse_yaml config.yaml)
CNT_ID=$(ssh root@$REMOTE_IP "docker run --rm --name 204034482_203523006 -d -p $PORT:5201/tcp -p $PORT:5201/udp orenzah/bgu-cloud-iperf:latest")
if [[ "$TRANSPORT" == "UDP" ]]; then

	iperf3 -u -c $REMOTE_IP -p $PORT -t $TIME -i $INTERVAL --forceflush | tee $OUTPUT_FILE
else
	iperf3 -c $REMOTE_IP -p $PORT -t $TIME -i $INTERVAL --forceflush | tee $OUTPUT_FILE

fi
#ssh orenzah@$REMOTE_IP "docker container stop $RPID"
#B=$(ssh orenzah@$REMOTE_IP "docker exec $CNT_ID pidof iperf3")
#A=$(ssh orenzah@$REMOTE_IP "docker exec $CNT_ID kill -9 $B")
A=$(ssh root@$REMOTE_IP "docker container stop $CNT_ID")
echo "Script Done"
