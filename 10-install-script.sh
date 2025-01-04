#!/bin/bash

USERID=$(id -u)

echo "Current User id is ::" ${USERID} # Normal User Id is 1001 and Sudo User Id is 0

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

# To Installation command of the Git Software
dnf list installed git

# To Installation the Git software without checking condtion whether this Git software is installed or not

# if [ $? -ne 0 ]
# then
#     echo "Installing Git ... FAILURE"
#     exit 1
# else
#     echo "Installing Git ... SUCCESS"
# fi

#To Installation the Git software with checking condtion whether this Git software is installed or not. 
# In case if it is this Git software is already installed, it will show the already this Git is installed

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Installing Git ... FAILURE"
        exit 1
    else
        echo "Installing Git ... SUCCESS"
    fi
else
    echo "Git is already ... INSTALLED"
fi

# To Installation command of the mysql Software
dnf list installed mysql-shell
