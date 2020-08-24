#!/bin/bash


data="/volume1/transfer/curiosum"


# you shoudln't need to change these variables
datefolder=$(date +"%Y-%m-%d")
logfile=$data/logs/$datefolder/explico-$today.log
line="======================================================"


# preamble
echo $line >> $logfile
printf "Curiosum audio-only RTSP recorder.\n" | tee -a $logfile
printf "  This script started at: '%s'\n" "${today}" | tee -a $logfile
touch $logfile
printf "  Storing data in: '%s'\n" "${data}" | tee -a $logfile
printf "  Checking that subdirectories /recordings and /logs exist.\n" | tee -a $logfile
mkdir -p \
    "${data}/logs/${datefolder}" \
    "${data}/recordings/${datefolder}" | tee -a $logfile
printf "  Logging to: '%s'\n" "${logfile}" | tee -a $logfile
printf "  Running openRTSP for: '%s's\n" "${duration}" | tee -a $logfile
echo $line >> $logfile

# conclusion
echo $line >> $logfile
printf "  Completed execution.\n" | tee -a $logfile


# end of script
