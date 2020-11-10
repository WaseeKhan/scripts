#! /bin/bash
#Author: Waseem
#Description: 	This script will generate three complex password	


echo
echo "====================== Password Boat Activated ====================="
echo
echo


echo "Hey! Please Provide the length of your password"
read passwd_length

	for p in $(seq 1 3)
		do
			openssl rand -base64 48 | cut -c1-$passwd_length
		done

