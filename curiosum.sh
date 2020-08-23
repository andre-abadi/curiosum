#!/bin/bash

today=$(date +"%Y-%m-%d-%H-%M-%S-%Z")
data="/volume1/transfer/curiosum"
address="rtsp://10.1.2.63:554/s1"
duration=10
let split=duration+1

# user-visible logs
printf "Curiosum audio-only RTSP recorder.\n"
printf "  This script started at: '%s'\n" "${today}"
printf "  Storing data in: '%s'\n" "${data}"
printf "  Checking that subdirectories /recordings and /logs exist.\n"
mkdir -p "${data}" "${data}/logs" "${data}/recordings"
printf "  Intervals will be split every: '%s's\n" "${duration}"
printf "  Running OpenRTSP command:"
openRTSP \
    -4 \
    -a \
    -d $duration \
    -P $split \
    -F ${data}/recordings/${today} \
    $address \
    > ${data}/logs/${today}.log 2>&1
printf "\nCompleted execution.\n"
