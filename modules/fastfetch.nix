{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
      };
      display = {
        separator = "->   ";
        color = "cyan";
      };
      modules = [
        { type = "title"; }
        "separator"
        {
          key = " Distro        ";
          type = "os";
        }
        {
          key = " Host          ";
          type = "host";
        }
        {
          key = " WM            ";
          type = "wm";
        }
        {
          key = " Locale        ";
          type = "locale";
        }
        {
          key = " Terminal      ";
          type = "terminal";
        }
        {
          key = "󰈺 Shell         ";
          type = "shell";
        }
        {
          key = " Stylix Theme  ";
          type = "command";
          text = "~/.config/fastfetch/theme";
        }
        {
          key = "󰂎 Battery       ";
          type = "battery";
        }
        {
          key = " Media         ";
          type = "media";
        }

        "break"
        {
          type = "colors";
          paddingLeft = 6;
          symbol = "circle";
        }
      ];

    };
  };
}
