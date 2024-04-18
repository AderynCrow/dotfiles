#! /bin/bash
	for (( i = 1 ; i < $(hyprctl activeworkspace | head -n 1 | awk -F'[^0-9]+' '{ print $2 }') ; i++ ))
	do
		echo -n "$i "
	done

