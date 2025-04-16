#!/bin/bash

USERID=$(id -u)

#Colors Declerations
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" # By Default color (White Color) in shell script

#Logs Declerations
LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# Creating the Validate Function using shell scripting
VALIDATE(){
    if($1 -ne 0)
    then
       echo -e "$2 ... $R Faliaure $N"
       exit 1
    else
        echo -e "$2 ... $G Success $N"
    fi
}

# Creating Function using shell script
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: You must have sudo access to execute this script"
        exit 1 #other than 0
    fi
}

echo "Script Started executing at::$TIMESTAMP" &>>$LOG_FILE_NAME

echo "Current User id is ::" ${USERID} # Normal User Id is 1001 and Sudo User Id is 0

CHECK_ROOT # Calling the Check root function with out  any input args

# Decleare the loops for installing the Packages in input args
for installPackage in $@
do
    # To Check the Package is installed or not
    dnf list installed $installPackage &>>$LOG_FILE_NAME
    #To installed the whatever we given Package name at run time or args, it will be installed
    if [ $? -ne 0 ]
    then
        dnf install $installPackage -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $installPackage" # Calling the Validate function with input1 (Previous command is success or not) and input2
    else
        echo -e "$installPackage is already ... $Y INSTALLED $N"
    fi
done