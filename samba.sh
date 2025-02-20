#!/bin/bash
# This script will install samba server on your system
OS=$(grep "^ID=" /etc/os-release | cut -d "=" -f 2 | cut -d '"' -f 2)

if [[ $OS == "debian" || $OS == "ubuntu" || $OS == "mint" ]]; then
    sudo apt update -y -q
    sudo apt install samba -y -q
elif [[ $OS == "centos" || $OS == "rhel" || $OS == "fedora" ]]; then
    sudo dnf install epel-release elrepo-release -y -q
    sudo dnf install samba -y -q
elif [[ $OS == "arch" || $OS == "manjaro" ]]; then
    sudo pacman -Ssy --noconfirm -q
    sudo pacman -S samba -q --nocomfirm
elif [[ $OS == "alpine" ]]; then
    sudo apk update -q
    sudo apk add samba -q --no-cache
fi