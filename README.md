**curiosum** (*plural* **curiosa**)

/ˌkyː.riˈoː.zʏm/

1. A possibly unimportant point of interest; a curiosity.
2. Audio-only RTSP recording system and waveform generator for analysis.

[![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/andre-abadi/curiosum/blob/master/LICENSE)

# Pre-Requisites

- livemedia-utils (for [OpenRTSP](http://www.live555.com/openRTSP/))
- [FFmpeg](https://ffmpeg.org/)
- [sha256sum](https://help.ubuntu.com/community/HowToSHA256SUM)

# Instructions

2. Clone this repo
3. Edit Variables in `curiosum.sh`

    - data
    - address
    - duration

4. Add `curiosum.sh` to Crontab

    - `@hourly /home/user/curiosum/curiosum.sh`

5. Run `explico.sh` to analyse a day's files
