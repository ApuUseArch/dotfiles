#!/bin/bash

# List of official repo packages to uninstall
pacman_apps=(
  dolphin
  dunst
  grim
  htop
  vim
  wofi

)

echo "🧹 Uninstalling official repo packages with pacman..."

for app in "${pacman_apps[@]}"; do
  if pacman -Qi "$app" &> /dev/null; then
    echo "➡️ Removing $app..."
    sudo pacman -Runs --noconfirm "$app"
  else
    echo "❗ $app is not installed."
  fi
done

echo "✅ Uninstallation complete!"
