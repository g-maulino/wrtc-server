CC	:= gcc
LIBS	:= $(shell pkg-config --libs --cflags gstreamer-webrtc-1.0 gstreamer-sdp-1.0 libsoup-2.4 json-glib-1.0)
CFLAGS	:= -O0 -ggdb -Wall -fno-omit-frame-pointer

all: wrtc-server

wrtc-server: wrtc-server.c
	"$(CC)" $(CFLAGS) $^ $(LIBS) -o $@

