#!/bin/bash

# Perform system update
sudo pacman -Syu

# Prompt user to install yay
read -p "Do you want to install yay? (y/n): " install_yay
if [ "$install_yay" = "y" ]; then
    # Install yay
    sudo pacman -S git base-devel --needed
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
fi

# Prompt user to install git
read -p "Do you want to install git? (y/n): " install_git
if [ "$install_git" = "y" ]; then
    # Install git
    sudo pacman -S git
fi

# Prompt user to start installing the list of packages
read -p "Do you want to start installing the list of packages? (y/n): " install_packages
if [ "$install_packages" = "y" ]; then
    # Install the list of packages
    packages="hyprland kitty dolphin jq hyprpaper waybar-hyprland waybar rofi wofi hyprshot pamixer pavucontrol brightnessctl htop btop pacman-contrib starship ttf-jetbrains-mono-nerd ttf-nerd-fonts"
    yay -S $packages
    pacman -S bluez bluez-utils blueman
fi

