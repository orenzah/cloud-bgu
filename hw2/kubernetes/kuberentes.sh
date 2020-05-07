#!/bin/sh
kubectl apply -f hw2_resources.yaml > /dev/null
IP=$(kubectl get service/hw2service -o yaml | grep -oh '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')
#echo $IP
end=$((SECONDS+240)) # 4 minutes
while [ ${SECONDS} -lt ${end} ]; do
	wget $IP:30555 -q -O-
done
echo -e ""
echo -e "Rollout to image with version 2.00"
echo -e ""
kubectl set image deployment/hw2deploy cloudnginx1=orenzah/custom-nginx:2.00 > /dev/null
kubectl rollout status deployment/hw2deploy > /dev/null
wget $IP:30555 -q -O-
echo -e ""
echo -e "Rolling back to previous version"
echo -e ""
kubectl rollout undo deployment/hw2deploy > /dev/null
kubectl rollout status deployment/hw2deploy > /dev/null
wget $IP:30555 -q -O-
kubectl delete deploy hw2deploy > /dev/null
kubectl delete service hw2service > /dev/null
kubectl delete hpa hw2deploy > /dev/null
echo -e "Great Success"

