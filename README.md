# Adafruit Voice Bonnet and Balena

https://learn.adafruit.com/adafruit-voice-bonnet

As part of another project an Adafruit Voice Bonnet was used on a Balena device. This repo provides the build process for getting the voice bonnet to work on Balena devices. It doesn't do anything after loading, it merely sleeps with an active HAT ready for testing or for you to put your own application on top.

Due to some issues with the most recent RPI kernel and out of date Adafruit firmware it is necessary to run this on an older Balena OS version (2.75.0+rev1):

Development:
https://api.balena-cloud.com/download?deviceType=raspberrypi4-64&version=2.75.0+rev1.dev&fileType=.zip

Production:
https://api.balena-cloud.com/download?deviceType=raspberrypi4-64&version=2.75.0+rev1.prod&fileType=.zip

Ensure the following DT overlays and DT parameters are entered in the Cloud dashboard or the config.json file.

DT_Params

```
"i2c_arm=on","spi=on","audio=on","i2s=on"
```

DT_Overlays

```
"vc4-kms-v3d","i2s-mmap","seeed-2mic-voicecard"
```

And insert ./overlays/2.75.0+rev1/seeed-2mic-voicecard.dtbo in to /overlays folder by inserting the SD card in to your card reader and copying across to the card before booting
