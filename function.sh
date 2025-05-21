#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
     echo "error:: please run the script with root user"
     exit 1
else
    echo "you are running with root user"
fi
VALIDATE(){
    if [ $? -eq 0 ]
    then
        echo "installing $2 is ... success"
    else 
        echo "installing $2 is ...not success"
    fi
}
dnf list installed mysql
if [$? -ne 0 ]
then 
    echo "mysql is not installed..going to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "mysql already installed...nothing to do"
fi

dnf list installed python3
if [$? -ne 0 ]
then 
    echo "python3 is not installed..going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 already installed...nothing to do"
fi

dnf list installed nginx
if [$? -ne 0 ]
then 
    echo "nginx is not installed..going to install"
    dnf install nginx  -y
    VALIDATE $? "nginx "
else
    echo "nginx already installed...nothing to do"
fi