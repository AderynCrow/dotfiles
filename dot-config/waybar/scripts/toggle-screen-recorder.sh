#!/bin/bash 

pid=`pgrep wf-recorder`
status=$?

if [ $status != 0 ] 
then 
	videoName=$(xdg-user-dir VIDEOS)/$(date +'recording_%Y-%m-%d-%H%M%S.mp4')
	wf-recorder -f $videoName
	notify-send "Video saved at $videoName"
else 
	pkill --signal SIGINT wf-recorder
fi;
