#!/bin/bash

###################################
#          Clunes Mail            #
#  Basic send only email program  #
###################################

f_quit(){
	clear
	echo -e "\e[1;31mThank You for using Clunes Mail!\e[0m"
	echo ""
	read -p "Press enter/return to quit..."
	clear
	exit
}

f_sameperson(){
	clear
	echo -e "\e[1;34mWriting another email to: \e[0m \e[1;31m$email\e[0m"
	echo ""
	read -p "Subject: " subject
	clear
	echo -e "\e[1;34mWriting another email to: \e[0m \e[1;31m$email\e[0m"
	echo ""
	read -p "Message: " messagebody
	clear
	f_confirmation
}

f_differentperson(){
	clear
	echo -e "\e[1;34mPlease enter a new recipient:\e[0m"
	echo ""
	read -p ">>> " email
	f_confirmation
}

f_editsubject(){
        clear
        echo -e "\e[1;34mPlease retype the subject correctly!\e[0m"
        echo -e "\e[1;31m [!] If subject is correct, type 1 and hit enter.\e[0m"
        echo ""
        echo -e "\e[1;34mHere is the original:\e[0m \e[1;31m$subject\e[0m"
        echo ""
        read -p ">>> " newsubject

        if [ "$newsubject" == "1" ]; then
                f_confirmation
        else
                subject=$newsubject
                f_confirmation
        fi
}

f_editmessage(){
        clear
        echo -e "\e[1;34mPlease retype the message correctly!\e[0m"
        echo -e "\e[1;31m [!] If message is correct, type 1 and hit enter.\e[0m"
        echo ""
        echo -e "\e[1;34mHere is the original:\e[0m \e[1;31m$messagebody\e[0m"
        echo ""
        read -p ">>> " newmessage

        if [ "$newmessage" == "1" ]; then
                f_confirmation
        else
                messagebody=$newmessage
                f_confirmation
        fi
}


f_editemail(){
	clear
	echo -e "\e[1;34mPlease retype the recipients email correctly!\e[0m"
	echo -e "\e[1;31m [!] If email is correct type 1 and hit enter.\e[0m"
	echo ""
	echo -e "\e[1;34mHere is the original:\e[0m \e[1;31m$email\e[0m"
	echo ""
	read -p ">>> " newemail

	if [ "$newemail" == "1" ]; then
		f_confirmation
	else
		email=$newemail
		f_confirmation
	fi
}

f_send(){
	clear
	echo -e "\e[1;34mEmail Sent!\e[0m"
	echo "$messagebody" | mail -s "$subject" $email
	echo ""
	read -p "Press enter/return to continue..."
	clear
	echo -e "\e[1;34mWhat would you like to do now?\e[0m"
	echo ""
	echo -e "\e[1;31m1\e[0m) \e[1;34mWrite another email?\e[0m"
	echo -e "\e[1;31m2\e[0m) \e[1;34mSend another email to: $email\e[0m"
	echo -e "\e[1;31m3\e[0m) \e[1;34mSend the same message to another person?\e[0m"
	echo -e "\e[1;31m4\e[0m) \e[1;31mQuit\e[0m"
	echo ""
	read -p ">>> " sent

	if [ "$sent" == "1" ]; then
		f_main
	elif [ "$sent" == "2" ]; then
		f_sameperson
	elif [ "$sent" == "3" ]; then
		f_differentperson
	elif [ "$sent" == "4" ]; then
		f_quit
	else
		f_quit
	fi
}

f_confirmation(){
	clear
	echo -e "\e[1;34mAre these details correct?\e[0m"
	echo -e "\e[1;31mReceipent: \e[0m" && echo $email
	echo ""
	echo -e "\e[1;31mSubject: \e[0m" && echo $subject
	echo ""
	echo -e "\e[1;31mMessage: \e[0m" && echo $messagebody
	echo ""
	read -p "Is this correct? (y or n) " correct
	if [ "$correct" == "y" ]; then
		f_send
	elif [ "$correct" == "n" ]; then
		clear
		echo -e "\e[1;34mWhat part needs to be updated?\e[0m"
		echo -e "\e[1;31m1\e[0m) Recipient"
		echo -e "\e[1;31m2\e[0m) Subject"
		echo -e "\e[1;31m3\e[0m) Message Body"
		echo -e "\e[1;31m4\e[0m) I hit the wrong key, everything is correct."

		read -p ">>> " problem
		if [ "$problem" == "1" ]; then
			f_editemail
		elif [ "$problem" == "2" ]; then
			f_editsubject
		elif [ "$problem" == "3" ]; then
			f_editmessage
		elif [ "$problem" == "4" ]; then
			f_confirmation
		else
			f_quit
		fi
	fi
}

f_main(){
	clear
	echo -e "\e[1;34mWelcome to Clunes Mail!\e[0m"
	echo ""
	echo -e "\e[1;31mTo whom shall I send this email?\e[0m"
	read -p ">>> " email
	clear
	echo -e "\e[1;31mPlease enter a subject: \e[0m"
	read -p ">>> " subject
	clear
	echo -e "\e[1;31mWhat shall this message say? \e[0m"
	read -p ">>> " messagebody
	f_confirmation
}

f_main
