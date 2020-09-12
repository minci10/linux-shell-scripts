#!/bin/bash

 #A script for finding the user who has got the
 #maximum number of file in current directory
 
function thewinneris(){
	inp="a"
	dirs=()
	index=0
	read inp
	#we get input and put it in array till typing STOP
	while [ $inp != "STOP" ]
	do
		dirs[$index]=$inp
		read inp
		((index=index+1))
	done
	
	for b in ${dirs[@]}; 
	do 
		cd $b
		files=($(ls -a))
		users=()
		
		for i in ${files[@]}; 
		do 
		#we don't interested in the files named "." and ".."
			if [ $i == '.' ] || [ $i == ".." ] ; then
				continue
			fi
			#the code in following line provides to get the creator  
			#user of current file and put the name into the array. "2>/dev/null" 
			#command provides to hide unwanted error messages.
		users+=($(stat -c '%U' $i 2>/dev/null))
		done
		max_times=0
		for j in ${users[@]}; 
		do 
		#we count how many file j'th user created.
			for k in ${users[@]}; 
			do 
				if [[ $k == $j ]]
				then
					((counter=counter+1))
				fi	
				
				if [[ $counter -gt $max_times ]]
				then
					max_times=$counter
					max_user=$j
				fi
			done
		counter=0
		done
		echo $max_user
	done
}

thewinneris

