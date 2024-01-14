#!/bin/bash

read -p "Write your username : " username
read -s -p "Write your password : " password
#Register your redhat instance with your account 
read -p "Do you want to register your RHEL instance ? (y/n): " register_choice
# Check user's choice
if [[ $register_choice == "y" || $register_choice == "Y" ]]; then
    echo "Starting account registration process..."
    sudo subscription-manager register --username "$username" --password "$password" --auto-attach
    echo "Account registration completed!"
else
    echo "Continuing with the script execution..."
fi
# Enabling RHSM
sudo subscription-manager config --rhsm.manage_repos=1

#Update packages
sudo yum update -y && yum upgrade -y ; sudo yum install python3.11 -y && sudo yum install python3.11-pip -y

# Installing ansible 
echo " ********** Just for info Adding the ansible repo is deprecated aswell as installing it {yum install ansible} now all in ansible-core in RHEL9 **********"
sudo dnf install ansible-core -y



echo " ********** Script execution completed, Ansible is deployed ********** "
