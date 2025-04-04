{
  home.file = {
    ".config/hypr/pyprland.toml" = {
      text = ''
        [pyprland]
        plugins = [ "scratchpads" ]

        [scratchpads.spotify]
        animation = "fromTop"
        command = "spotify --force-device-scale-factor=1.5 %U"
        class = "Spotify"
        size = "90% 90%"
        lazy = true

        [scratchpads.whatsapp]
        animation = "fromTop"
        command = "zapzap"
        class = "com.rtosta.zapzap"
        size = "90% 90%"
        lazy = false

        [scratchpads.email]
        animation = "fromTop"
        command = "thunderbird"
        class = "thunderbird"
        size = "90% 90%"
        lazy = false


        [scratchpads.timetable]
        animation = "fromTop"
        command = "imv ~/School/School-TimetableV2.png"
        class = "imv"
        size = "90% 90%"
        lazy = true

        [scratchpads.calculator]
        animation = "fromTop"
        command = "gnome-calculator"
        class = "org.gnome.Calculator"
        size = "90% 90%"
        lazy = true

        [scratchpads.pavucontrol]
        animation = "fromTop"
        command = "pavucontrol --tab 3"
        class = "org.pulseaudio.pavucontrol"
        size = "90% 90%"
        lazy = true

        [scratchpads.discord]
        animation = "fromTop"
        command = "discord --force-device-scale-factor=1.5"
        class = "discord"
        size = "90% 90%"
        lazy = true
      '';
    };
  };
}
