# curiosum

Audio-only RTSP Recorder

# References


# Pre-Requisites

- livemedia-utils (for [OpenRTSP](http://www.live555.com/openRTSP/))
- [FFmpeg](https://ffmpeg.org/)
- [SoX](http://sox.sourceforge.net/Main/HomePage)


# Instructions

2. Clone this repo
3. Edit Variables in `curiosum.sh`

- data
- address
- duration


4. Add `curiosum.sh` to Crontab

- `@hourly /home/eagle/curiosum/curiosum.sh`
