#! /bin/bash

for (( i = $(hyprctl activeworkspace | head -n 1 | awk -F'[^0-9]+' '{ print $2 }') + 1 ; i < $( hyprctl workspaces | grep "workspace ID" | sort -r |head -n 1| awk -F'[^0-9]+' '{ print $2 }' ) + 1 | i < 5 ; i++ ))
do
	echo -n "$i "
done
