{ config, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "margin-left" = 6;
        "margin-right" = 6;
        "margin-top" = 2;
        "exclusive" = true;
        "passthrough" = false;
        "reload_style_on_change" = true;

        "modules-left" = [
          "custom/launcher"
          "hyprland/workspaces"
          "custom/music"
        ];
        "modules-center" = [
          "clock#clock1"
          "custom/weather#main"
        ];
        "modules-right" = [
          "pulseaudio"
          "backlight"
          "custom/gpu"
          "battery"
          "cpu"
          "memory"
          "custom/notification"
          "network"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "sort-by-name" = true;
          "format" = " {icon} ";
          "format-icons" = {
            "default" = "";
          };
        };
        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{icon} {percent}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}{capacity}%";
          "on-click-right" = "kitty nvim ~/.dotfiles/hosts/laptop/battery.nix";
          "format-charging" = "󰂄{capacity}%";
          "format-plugged" = "";
          "format-alt" = "{icon}{time}";
          "format-icons" = [
            "󰂃"
            "󰂃"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁿"
            "󰂀"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        "custom/music" = {
          "format" = "{icon}{}";
          "format-icons" = {
            "Playing" = "󰝚 ";
            "Paused" = "󰝛 ";
            "Stopped" = " ";
          };
          "escape" = true;
          "tooltip" = true;
          "exec" = "~/.dotfiles/scripts/caway -b 10 -f 60 -e";
          "return-type" = "json";
          "on-click" = "playerctl play-pause";
          "on-scroll-up" = "playerctl previous";
          "on-scroll-down" = "playerctl next";
          "on-click-right" = "g4music";
          "max-length" = 24;
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-muted" = " ";
          "format-icons" = {
            "default" = [
              ""
              ""
              " "
            ];
          };
          "on-click" = "pavucontrol --tab=3";
        };
        "custom/notification" = {
          "tooltip" = false;
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "󱅫";
            "none" = "󰂚";
            "dnd-notification" = "󱅫";
            "dnd-none" = "󱏧";
            "inhibited-notification" = "󱅫";
            "inhibited-none" = "󱅫";
            "dnd-inhibited-notification" = "󱅫";
            "dnd-inhibited-none" = "󱏧";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click-right" = "swaync-client -d -sw";
          "on-click" = "swaync-client -t -sw";
          "escape" = true;
        };
        "custom/lock" = {
          "tooltip" = false;
          "on-click" = "hyprlock";
          "format" = "";
        };
        "custom/power" = {
          "tooltip" = false;
          "on-click" = "wlogout &";
          "format" = "";
        };
        "network" = {
          "tooltip" = true;
          "format-icons" = [
            "󰤟"
            "󰤢"
            "󰤥"
          ];
          "format-wifi" = "󰤥";
          "rotate" = 0;
          "format-ethernet" = "󰈀";
          "tooltip-format" = ''
            Network: <big><b>{essid}</b></big>
            Signal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>
            Frequency: <b>{frequency}MHz</b>
            Interface: <b>{ifname}</b>
            IP: <b>{ipaddr}/{cidr}</b>
            Gateway: <b>{gwaddr}</b>
            Netmask: <b>{netmask}</b>'';
          "format-linked" = "󰈀 {ifname} (No IP)";
          "format-disconnected" = "";
          "tooltip-format-disconnected" = "Disconnected";
          "on-click" = "kitty ~/.dotfiles/scripts/wifi-rebuild";
          "interval" = 2;
        };
        "memory" = {
          "interval" = 3;
          "format" = " {percentage}%";
          "tooltip-format" = "{used:0.2f}GiB used out of {total:0.2f}GiB";
          "on-click" = "kitty btop";
        };
        "cpu" = {
          "interval" = 1;
          "format" = " {usage}%";
        };
        "custom/gpu" = {
          "exec" = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
          "format" = "󰹙 {}%";
          "return-type" = "";
          "interval" = 3;
        };
        "custom/launcher" = {
          "format" = "";
          "on-click" = "ulauncher-toggle";
          "tooltip" = false;
        };
        "clock#clock1" = {
          "timezone" = "Europe/Dublin";
          "tooltip-format" = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          "format" = "{:%a, %d %b, %I:%M %p}";
          "on-click" = "pkill waybar; waybar";
        };
        "custom/weather#main" = {
          "format" = "{}°";
          "tooltip" = true;
          "interval" = 3600;
          "exec" = "wttrbar --location New+Ross";
          "return-type" = "json";
        };
      }
      {
        "exclusive" = false;
        "layer" = "bottom";
        "reload_style_on_change" = true;
        "position" = "top";
        "margin-top" = 150;
        "passthrough" = true;

        "modules-center" = [
          "custom/day"
        ];
        "custom/day" = {
          "exec" = "date +'%^A'";
          "format" = "{}";
        };
      }
      {
        "exclusive" = false;
        "layer" = "bottom";
        "reload_style_on_change" = true;
        "position" = "top";
        "margin-top" = 240;
        "passthrough" = true;

        "modules-center" = [
          "clock#date"
        ];
        "clock#date" = {
          "timezone" = "Europe/Dublin";
          "format" = "{:%d %B, %Y}";
        };
      }
      {
        "exclusive" = false;
        "layer" = "bottom";
        "reload_style_on_change" = true;
        "position" = "top";
        "margin-top" = 275;
        "passthrough" = true;

        "modules-center" = [
          "clock#time"
        ];
        "clock#time" = {
          "timezone" = "Europe/Dublin";
          "format" = "- {:%I:%M %p} -";
        };
      }
    ];
    style = with config.lib.stylix.colors; ''
        * {
            font-family: "0xProto Nerd Font";
            font-size: 13px;
            min-height: 0;
            padding: 0;
            margin: 0;
          }

          #waybar {
            background: transparent;
            color: #${base05-hex};
            margin: 5px 5px;
            opacity: 0.9;
          }

          #workspaces {
            border-radius: 0px 1rem 1rem 0px;
            margin: 5px;
            background-color: rgba(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b}, 0.8);
            margin-left: 0rem;
            margin-right: 1rem;
          }

          #workspaces button {
            color: #${base07-hex};
            border-radius: 1rem;
            padding: 0.4rem;
          }

          #workspaces button.active {
            color: #${base0C-hex};
            border-radius: 1rem;
          }

          #workspaces button:hover {
            color: #${base0C-hex};
            border-radius: 1rem;
          }
          
          #custom-launcher {
            color: #${base05-hex};
            border-radius: 1rem 0px 0px 1rem;
            margin-left: 6px;
          }

          #custom-launcher:hover {
            color: #${base0C-hex};
            border-radius: 1rem 0px 0px 1rem;
          }

          #tray,
          #backlight,
          #clock.clock1,
          #battery,
          #pulseaudio,
          #cpu,
          #custom-weather.main,
          #custom-music,
          #music,
          #cava,
          #memory,
          #custom-gpu,
          #network,
          #custom-launcher,
          #memory {
            background-color: rgba(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b}, 0.8);
            padding: 0.5rem 0.75rem;
            margin: 5px 0;
          }

          #custom-launcher,
          #custom-notification,
          #custom-lock,
          #custom-power {
            background-color: rgba(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b}, 0.8);
            padding: 0.5rem 1rem;
            margin: 5px 0;
          }

          #clock.clock1 {
            color: #${base07-hex};
            border-radius: 1rem 0px 0px 1rem;
          }

          #custom-weather.main {
            color: #${base0F-hex};
        	  border-radius: 0px 1rem 1rem 0px;
          }

          #battery {
            color: #${base0B-hex};
          }
          
          #battery.charging {
            color: #${base0B-hex};
          }

          #battery.warning:not(.charging) {
            color: #${base0A-hex};
          }

          #battery.critical:not(.charging) {
            color: #${base08-hex};
          }

          #backlight {
            color: #${base09-hex};
          }

          #pulseaudio {
            color: #${base08-hex};
            border-radius: 1rem 0px 0px 1rem;
            margin-left: 1rem;
          }

          #custom-notification {
      	    border-radius: 1rem 0px 0px 1rem;
      	    color: #${base0F-hex};
          }

          #custom-lock {
            border-radius: 0rem 0px 0px 0rem;
            color: #${base07-hex};
          }

          #custom-power {
            border-radius: 0px 1rem 1rem 0px;
            color: #${base08-hex};
          }

          #network {
      	    border-radius: 0rem 0px 0px 0rem;
      	    color: #${base07-hex};
          }

          #memory {
      	    color: #${base0E-hex};
      	    border-radius: 0px 1rem 1rem 0px;
      	    margin-right: 1rem;
          }

          #custom-gpu {
      	    color: #${base0A-hex};
          }

          #cpu {
        	  color: #${base07-hex};
          }

          #custom-music.Playing {
            background: rgba(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b}, 0.8);

            color: #${base0E-hex};
            border-radius: 1rem;
          }

          #custom-music.Paused,
          #custom-music.Stopped {
            background: rgba(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b}, 0.8);

            color: #${base05-hex};
            border-radius: 1rem;
          }

          #cava {
            color: #${base05-hex};
            border-radius: 0px 1rem 1rem 0px;
          }

          #custom-day {
            font-family: "anurati";
            font-size: 80px;
            color: #${base07-hex};
            letter-spacing: 50px;
          }

          #clock.date {
            color: #${base07-hex};
            font-size: 20px;
            font-weight: bold;
          }
          #clock.time {
            color: #${base07-hex};
            font-size: 15px;
            font-weight: bold;
          }
    '';
  };

  home.file = {
    ".config/waybar/scripts" = {
      source = ../scripts;
    };
  };
}
