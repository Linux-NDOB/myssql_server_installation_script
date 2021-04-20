#/bin/bash
###############################################
echo "WELCOME TO THE MySQL INSTALLATION SCRIPT"
###############################################
sleep 1
echo "Importing the public repository GPG keys"
sleep 1
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sleep 1
echo "Register the Microsoft Ubuntu repository "
echo "Ubuntu 20.0.4"
sleep 1
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sleep 1
echo "Updating the sources list and running the installation"
echo "command with the unixODBC developer package"
sudo apt-get update 
sleep 1
sudo apt-get install mssql-tools unixodbc-dev
sleep 1
echo "Updating to the latest version of mssql-tools..."
sleep 1
sudo apt-get update 
sleep 1
sudo apt-get install mssql-tools
sleep 1
echo "Optional:Add /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell"
#To make sqlcmd/bcp accessible from the bash shell for login sessions,
#modify your PATH in the ~/.bash_profile file with the following command:
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
#To make sqlcmd/bcp accessible from the bash shell for interactive/non-login sessions, modify the PATH in the ~/.bashrc file with the following command:
#echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
#source ~/.bashrc
