#!/bin/bash

today=$(date +"%Y-%m-%d-%H-%M-%S-%Z")
address="rtsp://10.1.2.63:554/s1"
data="/volume1/transfer/curiosum"
logfile=$data/logs/$today.log
duration=10
line="======================================================"
let split=duration+1

# user-visible logs
echo $line >> $logfile
printf "Curiosum audio-only RTSP recorder.\n" | tee -a $logfile
printf "  This script started at: '%s'\n" "${today}" | tee -a $logfile
printf "  Storing data in: '%s'\n" "${data}" | tee -a $logfile
printf "  Checking that subdirectories /recordings and /logs exist.\n" | tee -a $logfile
mkdir -p "${data}" "${data}/logs" "${data}/recordings" | tee -a $logfile
printf "  Logging to: '%s'\n" "${logfile}" | tee -a $logfile
printf "Running openRTSP for: '%s's\n" "${duration}" | tee -a $logfile
echo $line >> $logfile
openRTSP \
    -4 \
    -a \
    -d $duration \
    -P $split \
    -F ${data}/recordings/${today} \
    $address \
    >> ${data}/logs/${today}.log 2>&1
cat $logfile | grep Outputting
echo $line >> $logfile
printf "Completed execution.\n" | tee -a $logfile
