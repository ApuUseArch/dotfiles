#!/bin/bash

# ----- CONFIGURATION -----

# Official Arch packages (pacman)
pacman_apps=(
  thunar # File manager
  gvfs   # File manager healper
  rofi   # App launcher
  waybar # panel 
  nwg-look 
  blueman # Bluetooth manager gui
  btop   # Taskmanager
  swaync 
  fastfetch 
  fzf 
  fuse2
)

# AUR packages (yay)
aur_apps=(
  brave-bin
  visual-studio-code-bin
)

# ----- INSTALL PACMAN APPS -----

echo "📦 Installing official repo packages using pacman..."
for app in "${pacman_apps[@]}"; do
  echo "➡️ Checking $app..."
  sudo pacman -S --noconfirm --needed "$app"
done

# ----- INSTALL yay IF NEEDED -----

if ! command -v yay &> /dev/null; then
  echo "🚀 Installing yay from AUR..."
  mkdir ~/temp && cd ~/temp || exit
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin || exit
  makepkg -si --noconfirm
  cd ~ || exit
  rm -rf ~/temp
else
  echo "✅ yay is already installed."
fi

# ----- INSTALL AUR APPS -----

echo "📦 Installing AUR packages using yay..."
for app in "${aur_apps[@]}"; do
  echo "➡️ Checking $app..."
  yay -S --noconfirm --needed "$app"
done

# ----- UPDATE PACMAN PACKAGES -----

echo "🔄 Updating official repo packages using pacman..."
sudo pacman -Syu --noconfirm

# ----- UPDATE AUR PACKAGES -----

echo "🔄 Updating AUR packages using yay..."
yay -Sua --noconfirm

echo "✅ All installations and updates complete!"