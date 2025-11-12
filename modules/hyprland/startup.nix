{userSettings, ...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "sleep 4"
    "dbus-update-activation-environment --system --all"
    "hyprctl setcursor 16"
    "swww-daemon &"
    "sleep 2"
    "ulauncher --no-window-shadow &"
    "udiskie &"
    "wl-paste --watch clihist store &"
    "pypr &"
    "~/.dotfiles/scripts/auto-pull"
    "systemctl --user start hyprpolkitagent &"
    "pkexec swayosd-libinput-backend &"
    "swayosd-server &"
    "foot cava"
    "pkill waybar"
    "waybar &"
    "npx http-server ~/.dotfiles/modules/firefox/chevron"
    "discover-overlay"
  ];
}
