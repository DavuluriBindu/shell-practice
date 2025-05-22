#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "error::pls run this script with root access"
    exit 1 #give other than 0 upto 127
else 
     echo "you are running with root access"
fi

dnf install mysqlhjfjsdy -y

if [ $? -eq 0 ]
then 
    echo "installation nysql is ... success"
else
    echo "installation mysql is ... failure"
    exit 1
fi