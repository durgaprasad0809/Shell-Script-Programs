#!/bin/bash

USERID=$(id -u)

#Colors Declerations
R="\e[31m"
G="\e[32m"
Y="\e[33m"

echo "Current User id is ::" ${USERID} # Normal User Id is 1001 and Sudo User Id is 0

# Creating the Validate Function using shell scripting
VALIDATE(){
    if($1 -ne 0)
    then
       echo -e "$2 ... $R Faliaure"
       exit 1
    else
        echo -e "$2 ... $G Success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

# To Installation command of the Git Software
dnf list installed git

#To Installation the Git software with checking condtion whether this Git software is installed or not. 
# In case if it is this Git software is already installed, it will show the already this Git is installed

if [ $? -ne 0 ]
then
    dnf install git -y    
    VALIDATE $? "Installing Git" # Calling the Validate function with input1 (Previous command is success or not) and input2
else
    echo -e "Git is already ... $Y INSTALLED"
fi

# To Installation command of the mysql Software
dnf list install mysql

#To Installation the MySql software with checking condtion whether this MySql software is installed or not. 
# In case if it is this MySql software is already installed, it will show the already this MySql is installed
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing MY SQL" # Calling the Validate function with input1 (Previous command is success or not) and input2
else
    echo -e "MySQL is already ... $Y INSTALLED"
fi