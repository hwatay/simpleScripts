#!/bin/bash
#take time/date values for logs
_now=$(date +"%Y_%m_%d_%I_%M_%p")
OUTPUT="./output$_now.txt"

# file descriptor 4 prints to STDOUT and to TARGET
exec 4> >(while read a; do echo $a; echo $a >>$OUTPUT; done)
# file descriptor 5 remembers STDOUT
exec 5>&1
exec >&4
#This step is done to show output on screen and to pipe stdout to output file target

#3 operational checks
echo "Please Enter IP"
read server
ping -c 4 $server 
tracepath -m 10 $server
ssh $server

# Close Redirect
exec >&5

#bug-ssh command currently does not append to logfile, runs fine but no logging ? maybe a security feature.
