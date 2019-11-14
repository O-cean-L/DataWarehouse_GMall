#!/bin/bash
flume_home=/opt/module/flume-1.7.0
case $1 in
    start)
        for host in hadoop102 hadoop103 ; do
        echo "========== $host =========="
            ssh $host "source /etc/profile; nohup $flume_home/bin/flume-ng agent -n a1 -c $flume_home/conf -f /opt/dw/flume/filelog2kafka.conf >/opt/module/flume-1.7.0/logs/file2kafka.log 2>&1 & "
        done
    ;;
    stop)
        for host in hadoop102 hadoop103 ; do
        echo "========== $host =========="
            ssh $host "source /etc/profile; ps -ef | awk '/filelog2kafka.conf/ && !/awk/ {print \$2}' | xargs kill -9"
        done
    ;;
    *)
        echo "========== 启动姿势不正确 =========="
        echo "=== start  启动filelog到kafka集群"
        echo "===  stop  停止filelog到kafka集群"
    ;;
esac

