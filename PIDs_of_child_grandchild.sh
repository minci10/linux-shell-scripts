#!/bin/bash

 #A Script for printing all child and grandchild processes
 
function printthem() {
    child_processes=`pgrep -P $1|xargs`
    for c_process in $child_processes;
    do
        echo "$c_process"
        printthem $c_process
		
    done
}

printthem $1
