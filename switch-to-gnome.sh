#!/bin/bash
set -e

# Backup the entire home directory
BACKUP_FILE="$HOME/backup-$(date +%Y%m%d-%H%M%S).tar.gz"
echo "Backing up home directory to $BACKUP_FILE..."
tar -czvf "$BACKUP_FILE" --exclude="$BACKUP_FILE" "$HOME"


# Install GNOME and GDM
echo "Installing GNOME..."
sudo pacman -S --noconfirm gnome gnome-extra
sudo systemctl enable gdm.service

# Remove Hyprland and its dependencies
echo "The following packages will be removed:"
sudo pacman -Rns --print hyprland
read -p "Proceed with removal? [y/N]: " choice
if [[ "$choice" =~ [yY] ]]; then
    sudo pacman -Rns --noconfirm hyprland
fi

# Remove Hyprland configs and related files
echo "Removing Hyprland configs and related files..."
rm -rf ~/.config/hypr          # Hyprland configs
rm -rf ~/.cache/hyprland      # Hyprland cache
rm -rf ~/.local/share/hyprland # Hyprland local data
rm -rf ~/.local/bin/hypr*      # Hyprland-related binaries (if any)
rm -rf ~/.local/share/applications/hyprland.desktop # Desktop entry (if any)

# Optional: Remove AUR-installed Hyprland packages (if applicable)
if pacman -Qqm | grep -q hyprland; then
    echo "Removing AUR-installed Hyprland packages..."
    pacman -Qqm | grep hyprland | xargs -r yay -Rns --noconfirm
fi

echo "Done! Reboot your system."