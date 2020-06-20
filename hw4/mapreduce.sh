#!/bin/bash
INPUT=$1
OUTPUT_PHASE1="/output_py1"
OUTPUT_PHASE2="/output_py2"
OUTPUT_PHASE3="/output_py3"
OUTPUT_PHASE4="/output_py4"
OUTPUT=$2
hadoop fs -rm -r $OUTPUT_PHASE1 $OUTPUT_PHASE2 $OUTPUT_PHASE3
echo -e "Run Job 1"
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.7.7.jar \
	-D mapreduce.job.reduces=4 \
	-input $INPUT \
	-file  . \
	-output $OUTPUT_PHASE1 \
	-mapper map1.py \
	-file src/map1.py  \
	-reducer reducer1_.py  \
	-file src/reducer1_.py
echo -e "Run Job 2"
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.7.7.jar \
	-D mapreduce.job.reduces=2 \
	-input $OUTPUT_PHASE1 \
	-output $OUTPUT_PHASE2 \
	-mapper map2.py \
	-file src/map2.py \
	-reducer reducer2.py \
	-file src/reducer2.py

echo -e "Run Job 3"
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.7.7.jar \
	-D mapreduce.job.reduces=2 \
	-input $OUTPUT_PHASE2 \
	-output $OUTPUT_PHASE3 \
	-mapper map3.py \
	-file src/map3.py \
	-reducer reducer3.py \
	-file src/reducer3.py
echo -e "Run Job 4"
hadoop jar \
        /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.7.7.jar  \
	-D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapreduce.lib.partition.KeyFieldBasedComparator \
        -D stream.num.map.output.key.fields=3 \
        -D mapred.text.key.partitioner.options="-k1,1" \
        -D stream.map.output.field.separator="_" \
        -D mapreduce.map.output.key.field.separator="," \
        -D mapreduce.partition.keycomparator.options=-"k1,3r k2 k3" \
        -D mapreduce.job.reduces=1  \
        -input $OUTPUT_PHASE3 \
        -output $OUTPUT_PHASE4  \
        -mapper map4.py \
        -file src/map4.py  \
        -reducer reducer4.py  \
        -file src/reducer4.py
hadoop fs -getmerge $OUTPUT_PHASE4 $OUTPUT
