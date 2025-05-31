#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logs_folder="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$SCRIPT_NAME.log"
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
dnf list installed mysql &>>$log_file
if [ $? -ne 0 ]
then 
    echo "mysql is not installed..going to install" | tee -a $log_file
    dnf install mysql -y  &>>$log_file
    VALIDATE $? "mysql"
else
    echo -e "$Y mysql already installed...nothing to do $N" | tee -a $log_file
fi

dnf list installed python3 &>>$log_file
if [ $? -ne 0 ]
then 
    echo "python3 is not installed..going to install" | tee -a $log_file
    dnf install python3 -y &>>$log_file
    VALIDATE $? "python3"
else
    echo -e "$Y python3 already installed...nothing to do $N" | tee -a $log_file
fi

dnf list installed nginx &>>$log_file
if [ $? -ne 0 ]
then 
    echo "nginx is not installed..going to install" | tee -a $log_file
    dnf install nginx  -y &>>$log_file
    VALIDATE $? "nginx "
else
    echo -e "$Y nginx already installed...nothing to do $N" | tee -a $log_file
fi