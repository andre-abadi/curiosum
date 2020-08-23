# curiosum

Audio-only RTSP Recorder

# References

[OpenRTSP](http://www.live555.com/openRTSP/)
[systemd creation](https://unix.stackexchange.com/a/435407)

# Pre-Requisites

- CCTV camera with an RTSP stream
- Admin access to a linux computer running *systemd* (in this case Ubuntu)

# Journal

1. `sudo apt install livemedia-utils` (containing __openRTSP__)
2. Clone this repo
3. Add Service

- Copy `curiosum.service` to `/etc/systemd/system/`

4. Start the Service

- `sudo systemctl start curiosum.service`

5. Start Service on Boot

- `sudo systemctl enable curiosum.service`
