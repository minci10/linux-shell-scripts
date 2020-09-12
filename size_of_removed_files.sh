#!/bin/bash

 #A script for pause the session and then displays the
 #size of removed files in current directory
 
function watchdir() {


	truncate -s 2M file1
	truncate -s 1M file2
	
	files1=($(ls))
	size=()
	totalsize=0
	counter1=0
	
	for i in ${files1[@]};
	do
	
		size+=($(stat -c '%s' $i))
		
		((totalsize=totalsize+${size[$counter1]}))
		((counter1=counter1+1))
	done
	
	echo "sleeping for a while..."
	sleep $1
	rm file1
	rm file2
	files2=($(ls))
	counter2=0
	
	for j in ${files1[@]};
	do
		for k in ${files2[@]};
		do
			if [[ $j == $k ]]
			then
				((totalsize=totalsize-${size[$counter2]}))
			fi
		done
		((counter2=counter2+1))
	done
	
	echo "removed files total size "$totalsize" bytes"
}

watchdir $1
