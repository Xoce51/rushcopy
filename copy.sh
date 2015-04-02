#! /bin/bash
if [[ $# -eq 2 ]]
then
    echo "Parsing file $1";
    if [[ -f $1 ]]
    then
	i=0;
	occ=($(cat $1 | awk '/(\* FROM CLIP NAME:)\s*([\w])*/ { print $5}'));
	occLength=${#occ[@]};
	echo "Found $occLength occurence";
	for file in "${occ[@]}"
	do
	    :
	    i=$[i+1];
	    txt=$file;
	    cp $txt $2
	    if [[ $? -eq 0 ]]
	    then
		echo "File $i of $occLength copied ";
		echo $txt;
	    else
		echo 'Copy failed pass to next one';
	    fi
	done;
    else
	echo "File not found";
	exit 1;
    fi
else
    exit 1;
fi