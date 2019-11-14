#!/bin/bash

for host in hadoop103 hadoop104 ; do
    echo ========== $host ==========
    ssh $host "source /etc/profile ; nohup java -jar /opt/dw/data-producer/data-producer-1.0-SNAPSHOT-jar-with-dependencies.jar $1 $2 1>/dev/null 2>&1 &"
done