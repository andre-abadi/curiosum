#!/bin/bash


data="/volume1/transfer/curiosum"
analysis=$data/analysis
today=$(date +"%Y-%m-%d-%H-%M-%S-%Z")
datefolder=$(date +"%Y-%m-%d")
logfile=$data/logs/$datefolder/$today-explico.log
line="======================================================"



# preamble
touch $logfile
echo $line >> $logfile
printf "Explico audio analyser.\n" | tee -a $logfile
printf "  This script started at: '%s'\n" "${today}" | tee -a $logfile
read -p "  Type date to analyse in format YYYY-MM-DD: " target
printf "  Analysing recordings from: '%'s'\n" "${target}" | tee -a $logfile
list=$analysis/$target/files.txt
printf "  Storing analysis in: '%s'\n" "${analysis}/${target}" | tee -a $logfile
printf "  Checking that subdirectories exist.\n" | tee -a $logfile
mkdir -p "${analysis}/${target}" | tee -a $logfile
printf "  Logging to: '%s'\n" "${logfile}" | tee -a $logfile
echo $line >> $logfile

# execution
touch $list
find $data/recordings/$target/*.mp4 \
    | sed 's:\ :\\\ :g' \
    | sed 's/^/file /' \
    | tee $list
echo $line >> $logfile
cat $list >> $logfile
mkdir -p $analysis/$target
ffmpeg -f concat -safe 0 -i $list -c copy $analysis/$target/$target.aac

# conclusion
echo $line >> $logfile
printf "  Completed execution.\n" | tee -a $logfile


# end of script
