### home_directories.sh

A script which for any name given as an argument prints the list of paths
to home directories of people with the name. Example:

$ shownames muhammet ali  
/home/users/muhammet  
/home/students/j_ali  
/home/students/kubeusz  
/home/students/muha5z  
/home/students/qwertinx  
/home/users/ali  
/home/students/alidogan  


### size_of_removed_files.sh

A script which pauses the session for the number of seconds given as argument,
and then displays the total size of all files whose names were removed from the current
directory.
Example:

$ watchdir 60  
sleeping for a while...  
removed files total size 2345  


### user_with_max_files.sh

A script which for each directory given on standard input (in a separate line)
prints the user with the largest number of files in this directory.
Example:

$ thewinneris << STOP  
> /etc  
> /tmp  
> /home/users/muhammet  
> STOP  
root  
killertrashman  
muhammet  


### PIDs_of_child_grandchild.sh

A script which takes a PID as an argument and prints PID's of all its children,
grandchildren, grandgrandchildren etc.  
Example:  

$ printthem 3545  
3546  
3548  
3666  



