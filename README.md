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


Raspaudio branch

When I discovered the raspaudio project, I realize that was the way I wanted to integrate my system with buildroot but I didnt take time to search how to do such a thing. Now I have an example on the screen, I'll try to move my project in that direction.
What's the difference between Pijukebox and raspaudio ?
Today Pijukebox in strongly linked and integrted in a particular buildroot release while raspaudio is not as it integrtes it as a submodule. I want that too, this is the purpose of the raspaudio branch. 
