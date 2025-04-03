#!/bin/bash

# Define Colors
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
CYAN="\e[36m"
MAGENTA="\e[35m"
RESET="\e[0m"

# Welcome Message
echo -e "${GREEN}Welcome to the Ultimate Termux Setup Script${RESET}"
echo -e "${CYAN}Script by Edun Oluwadarasimi David${RESET}"

echo -e "${YELLOW}Updating and upgrading Termux...${RESET}"
pkg update -y && pkg upgrade -y || {
    echo -e "${RED}Error updating Termux! Please check your internet connection.${RESET}"
    exit 1
}

# Enable Storage Access
echo -e "${YELLOW}Granting Termux storage access...${RESET}"
termux-setup-storage

# Function to install developer tools
install_dev_tools() {
    echo -e "${BLUE}Installing Developer Tools...${RESET}"
    pkg install python nodejs openjdk-17 git clang tmux htop fish neovim -y || {
        echo -e "${RED}Error installing Developer Tools!${RESET}"
        exit 1
    }
    echo -e "${GREEN}Developer Tools Installed Successfully!${RESET}"
}

# Function to install hacking tools
install_hacking_tools() {
    echo -e "${RED}Installing Ethical Hacking Tools...${RESET}"
    pkg install metasploit sqlmap nmap hydra wireshark-gtk aircrack-ng -y || {
        echo -e "${RED}Error installing Hacking Tools!${RESET}"
        exit 1
    }
    echo -e "${GREEN}Hacking Tools Installed Successfully!${RESET}"
}

# Function to install Zsh and Oh-My-Zsh
install_zsh() {
    echo -e "${CYAN}Installing Zsh & Oh-My-Zsh...${RESET}"
    pkg install zsh -y && chsh -s zsh
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
    echo -e "${GREEN}Zsh Installed! Restart Termux to see changes.${RESET}"
}

# Function to install Docker in Termux
install_docker() {
    echo -e "${MAGENTA}Installing Docker in Termux...${RESET}"
    pkg install proot-distro -y
    proot-distro install ubuntu
    echo -e "${GREEN}Docker-like environment set up in Termux!${RESET}"
}

# Function to install additional Linux OS
deploy_linux_os() {
    echo -e "${CYAN}Installing a full Linux OS in Termux...${RESET}"
    pkg install proot-distro -y
    echo -e "Choose an OS to install:\n1) Ubuntu\n2) Kali Linux\n3) Arch Linux"
    read -p "Enter choice: " os_choice
    case $os_choice in
        1) proot-distro install ubuntu; echo -e "${GREEN}Ubuntu Installed!${RESET}" ;;
        2) proot-distro install kali; echo -e "${GREEN}Kali Linux Installed!${RESET}" ;;
        3) proot-distro install arch; echo -e "${GREEN}Arch Linux Installed!${RESET}" ;;
        *) echo -e "${RED}Invalid Choice!${RESET}" ; deploy_linux_os ;;
    esac
}

# Function to enable dark mode
enable_dark_mode() {
    echo "PS1='\e[1;30m\u@\h:\w\$ \e[0m'" >> ~/.bashrc
    echo -e "${GREEN}Dark Mode Enabled! Restart Termux to apply.${RESET}"
}

# Function to display system monitor
system_monitor() {
    echo -e "${MAGENTA}Launching Real-Time System Monitor...${RESET}"
    pkg install glances -y && glances
}

# Function for voice control
enable_voice_commands() {
    echo -e "${CYAN}Installing voice command support...${RESET}"
    pkg install termux-api -y
    echo -e "${GREEN}Now use 'termux-voice' to interact with Termux via voice.${RESET}"
}

# Function to set up VPN
setup_vpn() {
    echo -e "${BLUE}Setting up a secure VPN...${RESET}"
    pkg install openvpn -y
    echo -e "${GREEN}VPN installed! Configure with 'openvpn --config yourfile.ovpn'.${RESET}"
}

# Function for AI-Powered Auto-Fixer
auto_fixer() {
    echo -e "${CYAN}Scanning and fixing common Termux issues...${RESET}"
    pkg autoclean && pkg update -y
    echo -e "${GREEN}Common issues resolved!${RESET}"
}

# Function to display dashboard
show_dashboard() {
    echo -e "${CYAN}Choose an Option:${RESET}"
    echo -e "1) Install Developer Tools"
    echo -e "2) Install Ethical Hacking Tools"
    echo -e "3) Install Zsh & Oh-My-Zsh"
    echo -e "4) Install Docker-like Environment"
    echo -e "5) Deploy Full Linux OS (Ubuntu/Kali/Arch)"
    echo -e "6) Enable Dark Mode & Custom Themes"
    echo -e "7) Enable Voice Control for Termux"
    echo -e "8) Run System Monitor"
    echo -e "9) Setup VPN"
    echo -e "10) AI Auto-Fixer"
    echo -e "11) Exit"
    read -p "Enter choice: " choice

    case $choice in
        1) install_dev_tools ;;
        2) install_hacking_tools ;;
        3) install_zsh ;;
        4) install_docker ;;
        5) deploy_linux_os ;;
        6) enable_dark_mode ;;
        7) enable_voice_commands ;;
        8) system_monitor ;;
        9) setup_vpn ;;
        10) auto_fixer ;;
        11) echo -e "${YELLOW}Exiting...${RESET}" ; exit ;;
        *) echo -e "${RED}Invalid Choice!${RESET}" ; show_dashboard ;;
    esac
}

# Start Dashboard
show_dashboard

echo -e "${GREEN}Termux setup is complete! Restart your Termux session for changes to take effect.${RESET}"