#! /bin/bash
currentwokspace=$( hyprctl activeworkspace | head -n 1 )
while true
do
	if [[ $currentwokspace != $( hyprctl activeworkspace | head -n 1 ) ]]
	then
		exit 0
	fi
done
