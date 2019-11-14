#!/bin/bash
hive=/opt/module/hive-1.2.1/bin/hive
hadoop=/opt/module/hadoop-2.7.2/bin/hadoop
#默认导昨天的，还可以指定哪一天
if [[ -n $1 ]]; then
    do_data=$1
else
    do_data=`date -d '-1 day' +%F`
fi
sql="use gmall;
load data inpath '/origin_data/gmall/log/topic_start/$do_data' into talbe ods_start_log partition(dt='$do_data');
load data inpath '/origin_data/gmall/log/topic_event/$do_data' into talbe ods_start_log partition(dt='$do_data');"

$hive -e "$sql"
$hadoop jar /opt/module/hadoop-2.7.2/share/hadoop/common/hadoop-lzo-0.4.20.jar com.hadoop.compression.lzo.DistributedLzoIndexer /warehouse/gmall/ods/ods_start_log/dt=$do_date
$hadoop jar /opt/module/hadoop-2.7.2/share/hadoop/common/hadoop-lzo-0.4.20.jar com.hadoop.compression.lzo.DistributedLzoIndexer /warehouse/gmall/ods/ods_event_log/dt=$do_date