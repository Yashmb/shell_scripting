#!/usr/bin/bash

ts=$(date +%F)

while :
do
	read -p "enter the username to lock and backup : " user

	if [ -z $user ]
	then
		echo "username not provided"
	else
		if id $user &> /dev/null
		then
			passwd -l $user
			homeDir=$(grep ^${user}: /etc/passwd | cut -d ":" -f 6)
			if [ -d $homeDir ]
			then
				tar -cf ${user}-${ts}.tar $homeDir
			fi
			exit 0
		else
			echo "user $user doesn't exists"
		fi
	fi


done


exit 1
