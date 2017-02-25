# PiJukeBox
A RaspberryPi image for a car-jukebox based on mpd.

This image is based on buildroot in order to have a minimal configuration and
has been customized to fit my hardware configuration:

- Power supply of the raspberry is a 3A CAR SUPPLY / SWITCH from Mausberry CIRCUITS
(mausberry-circuits.myshopify.com)
- Music is stored on a SDD connected to the RaspberryPi through USB
- Music is played via a USB sound card in order to have better sound quality
(sound is really bad from analog output, especially when the rasp is powered by
the car)


Utils:
------

Default user:
login=pi
password=pi

Superuser:
password=root
