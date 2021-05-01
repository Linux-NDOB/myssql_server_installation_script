#/bin/bash
emulate -LR bash  #For multiple shell compaitibilities
#Instalation function for ubuntu 20

PATH=/bin:/usr/bin:

NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'

# echo -e "This text is ${RED}red${NONE} and ${GREEN}green${NONE} and ${BOLD}bold${NONE} and ${UNDERLINE}underlined${NONE}."

#COLORS IMPORTED 

prog() {
    local w=80 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d %% %s" "$w" "$dots" "$p" "$*"; 
}
# test loop
for x in {1..100} ; do
    prog "$x" LOADING SCRIPT...
    sleep .1   # do some work here
done ; echo

#ADDED PROGRESS BAR

echo "###############################################"
echo  "WELCOME TO THE SQL SERVER INSTALLATION SCRIPT"
echo "###############################################"

title="INSTALALTION SCRIPT"
prompt="Pick an option:"
options=("INSTALL FOR UBUNTU 16.04" "INSTALL FOR UBUNTU 18.04" "INSTALL FOR UBUNTU 20.04" "UNISTALL")

echo "$tittle"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 
    case "$REPLY" in
    1) _forUbuntu16;;
    2) _forUbuntu18;;
    3) _forUbuntu20;;
    $((${#options[@]}+1))) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;
    esac

done


#COMPLETE INSTALLATION SCRIPT FOR UBUNTU 20.0.4
_forUbuntu20(){
echo "Importing the public repository GPG keys"

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "Register the Microsoft Ubuntu repository "
echo "Ubuntu 20.0.4"

sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"

echo "Installing the latest version of mssql-tools..."

sudo apt-get update 

sudo apt-get install mssql-tools

echo "After the package installation finishes, run mssql-conf setup "
echo "and follow the prompts to set the SA password and choose your edition"

sudo /opt/mssql/bin/mssql-conf setup

echo "Once the configuration is done, verify that the service is running"

sudo systemctl status mssql-server --no-pager

echo "Installing the  SQL command-line tools"

echo "Importing the public repository GPG keys."

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "Registering the Microsoft Ubuntu repository."

curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

echo "Updating the sources list and running the installation command with the unixODBC developer package"

sudo apt-get update 

sudo apt-get install mssql-tools unixodbc-dev

echo "Updating to the latest version of mssql-tools"

sudo apt-get update 

sudo apt-get install mssql-tools

###############################################
echo "NOW SQL SERVER IS INATLLED ON YOUR DEVICE"
###############################################

echo "PROCEDING TO SHOW ANOTHER OPTIONS"

echo "DO YOU WANT TO ADD /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell"

echo "FOR LOGIN OR NO-LOGIN SESSIONS?"

echo "TYPE LOGIN/NO-LOGIN FOR ADD"

read SEL

if [ $SEL == "LOGIN" ]; then

echo "Optional: Add /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell."

echo "To make sqlcmd/bcp accessible from the bash shell for login sessions"

echo "Modify your PATH in the ~/.bash_profile file with the following command:"

sudo echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile

echo "Refreshing bash"
 
source ~/.bashrc

else if [ $SEL == "NO-LOGIN" ]; then

echo "To make sqlcmd/bcp accessible from the bash shell for interactive/non-login sessions"
echo "Modify the PATH in the ~/.bashrc file with the following command:"

echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

echo "Refreshing bash"

source ~/.bashrc
fi
}

_forUbuntu18(){

echo "Importing the public repository GPG keys:"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "Register the Microsoft Ubuntu repository "
echo "Ubuntu 20.0.4"

sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"

echo "Installing the latest version of mssql-tools..."

sudo apt-get update
sudo apt-get install -y mssql-server

echo "After the package installation finishes, run mssql-conf setup "
echo "and follow the prompts to set the SA password and choose your edition"

sudo /opt/mssql/bin/mssql-conf setup

echo "Once the configuration is done, verify that the service is running"

sudo systemctl status mssql-server --no-pager

echo "Installing the SQL Server command-line tools"

echo "Importing the public repository GPG keys."

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "Registering the Microsoft Ubuntu repository."

curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

echo "Updating the sources list and running the installation command with the unixODBC developer package"

sudo apt-get update 

sudo apt-get install mssql-tools unixodbc-dev

echo "Updating to the latest version of mssql-tools"

sudo apt-get update 

sudo apt-get install mssql-tools


echo "###############################################"
echo "NOW SQL SERVER IS INATLLED ON YOUR DEVICE"
echo "###############################################"

echo "PROCEDING TO SHOW ANOTHER OPTIONS"

echo "DO YOU WANT TO ADD /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell"

echo "FOR LOGIN OR NO-LOGIN SESSIONS?"

echo "TYPE LOGIN/NO-LOGIN FOR ADD"

read SEL

if [ $SEL == "LOGIN" ]; then

echo "Optional: Add /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell."

echo "To make sqlcmd/bcp accessible from the bash shell for login sessions"

echo "Modify your PATH in the ~/.bash_profile file with the following command:"

sudo echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile

echo "Refreshing bash"
 
source ~/.bashrc

else if [ $SEL == "NO-LOGIN" ]; then

echo "To make sqlcmd/bcp accessible from the bash shell for interactive/non-login sessions"
echo "Modify the PATH in the ~/.bashrc file with the following command:"

echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

echo "Refreshing bash"

source ~/.bashrc
fi
}


_forUbuntu_16(){

echo "Importing the public repository GPG keys"

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "Register the Microsoft Ubuntu repository "
echo "Ubuntu 16.0.4"

sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2019.list)"

echo "Installing the latest version of mssql-tools..."

sudo apt-get update 

sudo apt-get install mssql-tools

echo "After the package installation finishes, run mssql-conf setup "
echo "and follow the prompts to set the SA password and choose your edition"

sudo /opt/mssql/bin/mssql-conf setup

echo "Once the configuration is done, verify that the service is running"

sudo systemctl status mssql-server --no-pager

echo "Installing the  SQL command-line tools"

echo "Importing the public repository GPG keys."

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "Registering the Microsoft Ubuntu repository."

curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

echo "Updating the sources list and running the installation command with the unixODBC developer package"

sudo apt-get update 

sudo apt-get install mssql-tools unixodbc-dev

echo "Updating to the latest version of mssql-tools"

sudo apt-get update 

sudo apt-get install mssql-tools


###############################################
echo "NOW SQL SERVER IS INATLLED ON YOUR DEVICE"
###############################################

echo "PROCEDING TO SHOW ANOTHER OPTIONS"

echo "DO YOU WANT TO ADD /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell"

echo "FOR LOGIN OR NO-LOGIN SESSIONS?"

echo "TYPE LOGIN/NO-LOGIN FOR ADD"

read SEL

if [ $SEL == "LOGIN" ]; then

echo "Optional: Add /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell."

echo "To make sqlcmd/bcp accessible from the bash shell for login sessions"

echo "Modify your PATH in the ~/.bash_profile file with the following command:"

sudo echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile

echo "Refreshing bash"
 
source ~/.bashrc

else if [ $SEL == "NO-LOGIN" ]; then

echo "To make sqlcmd/bcp accessible from the bash shell for interactive/non-login sessions"
echo "Modify the PATH in the ~/.bashrc file with the following command:"

echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

echo "Refreshing bash"

source ~/.bashrc
fi
}

tput sgr0






