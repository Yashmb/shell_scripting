#!/usr/bin/bash

user=$(cat db.csv)

for i in $user
do
if id $i &> /dev/null
then
	echo "$i user already exixts..."
else
	if useradd $i
	then
		echo "user $i is created !!"
	else
		echo "user $i creation failed..."
	fi
fi
done

