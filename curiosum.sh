#!/bin/bash

# change these variables as required
address="rtsp://10.1.2.63:554/s1"
data="/volume1/transfer/curiosum"

# you shoudln't need to change these variables
today=$(date +"%Y-%m-%d-%H-%M-%S-%Z")
logfile=$data/logs/$today.log
duration=3600
line="======================================================"
# below  is because otherwise a 1s file gets made after duration
let split=duration+1

# preamble
echo $line >> $logfile
printf "Curiosum audio-only RTSP recorder.\n" | tee -a $logfile
printf "  This script started at: '%s'\n" "${today}" | tee -a $logfile
printf "  Storing data in: '%s'\n" "${data}" | tee -a $logfile
printf "  Checking that subdirectories /recordings and /logs exist.\n" | tee -a $logfile
mkdir -p "${data}" "${data}/logs" "${data}/recordings" | tee -a $logfile
printf "  Logging to: '%s'\n" "${logfile}" | tee -a $logfile
printf "Running openRTSP for: '%s's\n" "${duration}" | tee -a $logfile
echo $line >> $logfile

# execution
openRTSP \
    -4 \
    -a \
    -K \
    -Q \
    -d $duration \
    -P $split \
    -F ${data}/recordings/${today} \
    $address \
    >> ${data}/logs/${today}.log 2>&1

# conclusion
cat $logfile | grep Outputting
echo $line >> $logfile
printf "Completed execution.\n" | tee -a $logfile
