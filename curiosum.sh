#!/bin/bash


# change these variables as required
address="rtsp://10.1.2.63:554/s1"
data="/volume1/transfer/curiosum"


# you shoudln't need to change these variables
today=$(date +"%Y-%m-%d-%H-%M-%S-%Z")
datefolder=$(date +"%Y-%m-%d")
logfile=$data/logs/$datefolder/$today-curiosum.log
duration=3600
line="======================================================"
# below  is because otherwise a 1s file gets made after duration
let split=duration+1


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


# execution
openRTSP \
    -4 \
    -a \
    -K \
    -Q \
    -d $duration \
    -P $split \
    -F ${data}/recordings/${datefolder}/${today} \
    $address \
    >> $logfile 2>&1


#calculate checksum
echo $line >> $logfile
printf "  Calculating SHA256 checksum of recording file just completed:\n " | tee -a $logfile
sha256sum ${data}/recordings/${datefolder}/${today}-00000-03601.mp4 \
    | tee -a $logfile

# blockchain off the previous log file
echo $line >> $logfile
printf "  Calculating SHA256 checksum of previous logfile for blockchain:\n" | tee -a $logfile
# scan logfiles and find second last file (last file is still being written-to)
$prevlog="find ${data}/logs -name '*.log' | tail -n 2 | head -n 1"
printf "  Previous logfile was: '%s'\n" "${prevlog}" | tee -a $logfile
sha256sum $prevlog | tee -a $logfile


# conclusion
cat $logfile | grep Outputting
echo $line >> $logfile
printf "  Completed execution.\n" | tee -a $logfile


# end of script
