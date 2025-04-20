templ(){
	FILE=$1     
	EXTENSION=${1#${1%\.*}}
	TEMPLATE=$(find ~/Templates -maxdepth 1 -type f -iname "*$EXTENSION")
	if [ -f "$FILE" ]; then
		echo "File $FILE exists."
		return 1;
	fi
	if [ ! -f "$TEMPLATE" ]; then
		echo "No Template Found; creating blank file"
		touch $FILE
		return 1;
	fi
	cp "$TEMPLATE" "$FILE"
}
