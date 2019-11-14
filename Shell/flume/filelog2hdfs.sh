#!/bin/bash

/opt/dw/flume/kafka2hdfs.sh $1
case $1 in
    start)
        sleep 5
    ;;
esac
/opt/dw/flume/filelog2kafka.sh $1