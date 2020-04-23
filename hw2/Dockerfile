ARG CODE_VERSION=3.11.5
FROM alpine:${CODE_VERSION} AS bgu-cloud-iperf
RUN apk update
RUN apk add iperf3
EXPOSE 5201
CMD nohup iperf3 -s >  /dev/null 2>&1 & sleep infinity
