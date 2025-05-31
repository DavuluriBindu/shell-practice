#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logs_folder="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$SCRIPT_NAME.log"
PAKAGES={"mysql","python3","nginx"
}
mkdir -p $logs_folder
echo "script started executing at:$(date)" | tee -a $log_file

if [ $userid -ne 0 ]
then 
     echo -e "$R error:: please run the script with root user $N" | tee -a $log_file
     exit 1
else
    echo "you are running with root user" | tee -a $log_file
fi
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e " installing $2 is ... $G success $N" | tee -a $log_file
    else 
        echo -e "installing $2 is ... $R not success $N" | tee -a $log_file
    fi
}
for pakage in ${PAKAGES[@]}
do
dnf list installed $pakage &>>$log_file
if [ $? -ne 0 ]
then 
    echo "$pakage is not installed..going to install" | tee -a $log_file
    dnf install $pakage -y  &>>$log_file
    VALIDATE $? "$pakage"
else
    echo -e "$Y $pakage already installed...nothing to do $N" | tee -a $log_file
fi
done