#!/bin/bash

# To display the scrip name
echo "Script name: $0"

# To display the present working directory
echo "Present working directory: $PWD"

# To display the home working directory
echo "Home directory of current user: $HOME"

# To display the whos is user is running the scriptpresent working directory
echo "Which user is running this script: $USER"

# To display the all variables/allinput parameters in case if we given
echo "All variables passed: $@"
echo "Number of variables: $#"

#To dsiplay the current and after 60 seconds of the script id
echo "Process id of current script: $$"
sleep 60 &
echo "Process id of last command in background: $!"