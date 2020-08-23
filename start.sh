#!/bin/bash
today=$(date +"%Y-%m-%d-%H-%M-%S")
printf "This script started at '%s'\n" "${today}"
openRTSP -4 -a -P 10 -F /volume1/transfer/openRTSP/recordings/${today} rtsp://10.1.1.64:554/s1 > /volume1/transfer/openRTSP/logs/${today}.log 2>&1
