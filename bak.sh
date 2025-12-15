bak(){
	FILE=$1     
	if [ ! -f "$FILE" ]; then
		echo "File $FILE doesn't exists."
		return 1;
	fi
	BAKFILE=$FILE.bak
	while [ -f "$BAKFILE" ]
		do
			BAKFILE=$BAKFILE.bak
		done
	cp $FILE $BAKFILE
			
}
