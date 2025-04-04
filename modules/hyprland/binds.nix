{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
    "$filemanager" = "nautilus";
    "$browser" = "librewolf";
    bind = [
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive"
      "$mainMod, Y, exec, $filemanager"
      "$mainMod, V, togglefloating,"
      "$mainMod, J, togglesplit, # dwindle"
      "$mainMod, W, exec, $browser"
      "$mainMod, X, fullscreen, 0"

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod SHIFT, left, swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up, swapwindow, u"
      "$mainMod SHIFT, down, swapwindow, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"

      "$mainMod, 1, exec, pypr hide '*'"
      "$mainMod, 2, exec, pypr hide '*'"
      "$mainMod, 3, exec, pypr hide '*'"
      "$mainMod, 4, exec, pypr hide '*'"
      "$mainMod, 5, exec, pypr hide '*'"
      "$mainMod, 6, exec, pypr hide '*'"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"

      "$mainMod, 7, exec, pypr toggle timetable"
      "$mainMod, 8, exec, pypr toggle pavucontrol"
      "$mainMod, 0, exec, pypr toggle whatsapp"
      "$mainMod, code:20, exec, pypr toggle email"
      "$mainMod, code:21, exec, pypr toggle spotify"
      "$mainMod, M, exec, pypr toggle calculator"
      "$mainMod, L, exec, pkill wlogout || wlogout"
      "$mainMod, U, exec, ~/.dotfiles/scripts/hypr-powersaver-on"
      "$mainMod, I, exec, ~/.dotfiles/scripts/hypr-powersaver-off"

      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
      "$mainMod SHIFT, P, exec, hyprshot -m region"

      "$mainMod, N, exec, ulauncher-toggle"
      "$mainMod, B, exec, swaync-client -t"
      "$mainMod SHIFT, B, exec, swaync-client -C"
      "$mainMod, P, exec, waypaper"
      "$mainMod, E, exec, kitty --detach fish -C y"
      "$mainMod, O, exec, remnote --enable-features=UseOzonePlatform --ozone-platform=wayland"

      "$mainMod, R, exec, ~/.dotfiles/scripts/reloader"

      ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ",XF86Display, exec, kitty ~/.dotfiles/scripts/theme-switcher"
      ",XF86WLAN, exec, kitty ~/.dotfiles/scripts/wifi-rebuild"
      ",XF86Tools, exec, kitty nvim ~/.dotfiles"
      ",XF86Bluetooth, exec, blueman-manager"
      ",XF86Keyboard, exec, polychromatic-controller"
      ",XF86Favorites, exec, kitty ~/.dotfiles/scripts/package-rebuild"
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"

      "$mainMod, semicolon, exec, emote"
    ];

    binde = [
      "$mainMod ctrl, left, resizeactive, -10 0"
      "$mainMod ctrl, right, resizeactive, 10 0"
      "$mainMod ctrl, up, resizeactive, 0 -10"
      "$mainMod ctrl, down, resizeactive, 0 10"
      ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindn = [
      ", v, pass, ^discord$"
      ", Caps_Lock, exec, sleep 0.1; swayosd-client --caps-lock"
    ];
  };
}
