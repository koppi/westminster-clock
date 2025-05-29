SHELL=/bin/bash

prefix?=/usr/local

all:

samples:
	# remove noise from sambles
	/bin/mkdir -p out
	sox orig/noise.wav -n noiseprof out/noise.prof
	cd orig && for f in `ls -1 *.wav`; do echo $$f; sox -S --multi-threaded --buffer 131072 $$f ../out/$$f noisered ../out/noise.prof 0.21 silence -l 1 0.3 5% -1 2.0 5%; done && cd ..

install: samples
	install -m 0755 play-wav $(prefix)/bin
	install -m 0775 westminster-clock $(prefix)/bin
	/bin/mkdir -p /usr/share/sounds/westminster-clock
	cd out && for f in `ls -1 *.wav`; do install -m 0775 $$f /usr/share/sounds/westminster-clock/$$f; done && cd ..

clean:
	/bin/rm -rf out/* noise.prof
