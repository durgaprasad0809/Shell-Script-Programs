#!/bin/bash

USERID=$(id -u)

echo "Current User id is ::" ${USERID} # Normal User Id is 1001 and Sudo User Id is 0

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

# To Installation command of the mysql Software
dnf list installed mysql

# To Installation command of the Git Software
dnf list installed git

# if [ $? -ne 0 ]
# then # not installed
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then
#         echo "Installing MySQL ... FAILURE"
#         exit 1
#     else
#         echo "Installing MySQL ... SUCCESS"
#     fi
# else
#     echo "MySQL is already ... INSTALLED"
# fi

# if [ $? -ne 0 ]
# then
#     echo "Installing MySQL ... FAILURE"
#     exit 1
# else
#     echo "Installing MySQL ... SUCCESS"
# fi

# if [ $? -ne 0 ]
# then
#     echo "Installing Git ... FAILURE"
#     exit 1
# else
#     echo "Installing Git ... SUCCESS"
# fi

# dnf list installed git

# if [ $? -ne 0 ]
# then
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "Installing Git ... FAILURE"
#         exit 1
#     else
#         echo "Installing Git ... SUCCESS"
#     fi
# else
#     echo "Git is already ... INSTALLED"
# fi


