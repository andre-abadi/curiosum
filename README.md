# curiosum

Audio-only RTSP Recorder

# References

[OpenRTSP](http://www.live555.com/openRTSP/)

# Journal

1. `sudo apt install livemedia-utils` (containing __openRTSP__)
2. Clone this repo
3. Edit Variables

- data
- address
- duration

4. Run File

`./curiosum.sh`

5. Add to crontab

- `@hourly /home/eagle/curiosum/curiosum.sh`
