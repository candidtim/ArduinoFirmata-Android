all: build

init:
	cd usb-serial-for-android &&\
	git submodule init &&\
	git submodule update &&\
	git pull origin master &&\
	cd ../ &&\
	cp -R usb-serial-for-android/UsbSerialLibrary/src/com src/

compile:
	cd src &&\
	javac org/shokai/firmata/ArduinoFirmataException.java &&\
	javac org/shokai/firmata/ArduinoFirmataEventHandler.java &&\
	javac org/shokai/firmata/ArduinoFirmataDataHandler.java &&\
	javac org/shokai/firmata/ArduinoFirmata.java

build: compile
	cd src &&\
	jar cvf arduino-firmata.jar ./org &&\
	jar uvf arduino-firmata.jar ../README.md &&\
	jar uvf arduino-firmata.jar ../LICENSE.txt &&\
	jar uvf arduino-firmata.jar ../History.txt &&\
	mv arduino-firmata.jar ../
