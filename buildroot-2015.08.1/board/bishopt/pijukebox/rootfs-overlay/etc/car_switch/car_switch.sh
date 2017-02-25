#!/bin/sh

#this is the GPIO pin connected to the lead on switch labeled OUT
GPIOpin1=23

#this is the GPIO pin connected to the lead on switch labeled IN
GPIOpin2=24

#Enter the shutdown delay in minutes
delay=5

#Debug messages function
this_script_name=$0
log_file=/var/log/car_switch.log

log(){
  uptime_debug=$(cat /proc/uptime)
  uptime_debug=${uptime_debug% *}
  echo "[$uptime_debug] $this_script_name : $1" >> $log_file
}

echo "$GPIOpin1" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio$GPIOpin1/direction
echo "$GPIOpin2" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$GPIOpin2/direction
echo "1" > /sys/class/gpio/gpio$GPIOpin2/value
let minute=$delay*60
SD=0
SS=0
SS2=0
if [ -f $log_file ]
then
  rm $log_file
fi

while [ 1 = 1 ]; do

power=$(cat /sys/class/gpio/gpio$GPIOpin1/value)
uptime=$(cat /proc/uptime)
uptime=${uptime%%.*}
current=$uptime

log "========= New test at $uptime========="
log "GPIO$GPIOpin1 is powered ? $power"

if [ $power -eq 1 ] && [ $SD -eq 0 ]
then
  SD=1
  SS=${uptime%%.*}
  log "power=1 & SD=0 => SD=1 & SS=$SS"
fi

if [ $power -eq 1 ]  && [ $SD -eq 1 ]
then
  SS2=${uptime%%.*}
  log "power=1 & SD=1 => SS2=$SS2"
fi

if [ "$((uptime - SS))" -gt "$minute" ] && [ $SD = 1 ] && [ $power = 1 ]
then
  poweroff
  SD=3
  log "power=1 & SD=1 & $uptime - $SS gt $minute => poweroff & SD=$SD"
fi

if [ "$((uptime - SS2))" -gt '20' ] && [ $SD = 1 ]
then
  SD=0
  log "SD=1 & $uptime - $SS2 gt 20 => SD=$SD"
fi

sleep 1
done

