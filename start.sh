#!/bin/bash
today=$(date +"%Y-%m-%d-%H-%M-%S")
printf "This script started at '%s'\n" "${today}"
mkdir /volume1/transfer/curiosum /volume1/transfer/curiosum/logs /volume1/transfer/curiosum/recordings
openRTSP -4 -a -P 10 -F /volume1/transfer/curiosum/recordings/${today} rtsp://10.1.1.64:554/s1 > /volume1/transfer/curiosum/logs/${today}.log 2>&1
