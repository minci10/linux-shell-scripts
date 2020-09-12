#!/bin/bash

 #A script for getting home directory by name of users
  
function shownames(){

	args=("$@")
	usernames=($(compgen -u))
	
	for a in ${args[@]};
	do 
	
		for i in ${usernames[@]}; 
		do 
 #obtaining name and surname of i'th user
		name_surname=$(getent passwd $i | awk -F: '{ print $5 }')
 #we need to split the string and get only name of user
		name_surname=$( echo "$name_surname" | cut -d' ' -f1 )
 #making the name lowercase
		name_surname="${name_surname,,}"
 
		if [ "$name_surname" == $a ] ; then
		
			getent passwd $i | awk -F: '{ print $6 }'
			
		fi
		done
	done
}

shownames $@
