#!/bin/bash
flume_home=/opt/module/flume-1.7.0
case $1 in
    start)
        echo "========== hadoop104 =========="
            ssh hadoop104 "source /etc/profile; nohup $flume_home/bin/flume-ng agent -n a1 -c $flume_home/conf -f /opt/dw/flume/kafka2hdfs.conf >/opt/module/flume-1.7.0/logs/kf2hdfs.log 2>&1 & "
    ;;
    stop)
        echo "========== hadoop104 =========="
            ssh hadoop104 "source /etc/profile; ps -ef | awk '/kafka2hdfs.conf/ && !/awk/ {print \$2}' | xargs kill -9"
    ;;
    *)
        echo "========== 启动姿势不正确 =========="
        echo "=== start  启动kafka到hdfs集群"
        echo "===  stop  停止kafka到hdfs集群"
    ;;
esac

