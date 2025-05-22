#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "error::pls run this script with root access"
else 
     echo "you are running with root access"
fi

dnf install mysql -y
