# wrtc-server

Simple example of streaming server sending a file to a web client using WebRTC with GStreamer.
The server is a hacked version of the gst-examples from the [gst-examples GitLab repo](https://gitlab.freedesktop.org/gstreamer/gst-examples/-/tree/master/webrtc)

## Required libraries and services
- Tested on a Linux system (Debian 11)
- [libGstreamer](https://gstreamer.freedesktop.org/)
- A running web server like Apache or nginx. (A docker file is present for convenience)
- Chrome or Firefox browser

## Install
1. once the repository cloned `cd wrtc-server`
2. `make`
3. Download the sample video `wget https://www.freedesktop.org/software/gstreamer-sdk/data/media/sintel_trailer-480p.webm` to the wrtc-server/ directory
4. Deploy the web client `sudo cp -R web/ /var/www/html` or wherever is your web root directory

## Run the test
- Launch a browser and load the client page `http://localhost/web/`
- go to the server repository and run `./wrtc-server`
- The sintel video should play in the web page

## Limitations:
- Server is running once (after the pipeline is destroyed the program exits)
- Signalling is using a third party service (webrtc.nirbheek.in) so an internet access is required.
- There is a known issue with the JS script: the getUserMedia function needs to be called in order to get the server video (The local audio/video stream is not added to the RTCPeerConnection but for some reason disabling it is preventing the video to be shown (seems to be a server issue still under investigation)

## Improvements to be done
- Fix the getUserMedia issue
- Improve transcoding and parametrize it (maybe use different codecs libx264 baseline or others depending on the user-agent)
- Make a standalone server that runs multiple thread for multiple client requests
- Clean-up the code and make it modular
- Add signalling service to the server

