#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]
then 
     echo -e"$R error:: please run the script with root user $N"
     exit 1
else
    echo "you are running with root user"
fi
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e" installing $2 is ... $G success $N"
    else 
        echo -e "installing $2 is ... $R not success $N"
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed..going to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "mysql already installed...nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "python3 is not installed..going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 already installed...nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "nginx is not installed..going to install"
    dnf install nginx  -y
    VALIDATE $? "nginx "
else
    echo "nginx already installed...nothing to do"
fi