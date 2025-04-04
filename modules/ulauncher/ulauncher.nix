{ config, ... }:

{
  imports = [
    ./extensions/extensions.nix
  ];
  home.file = with config.lib.stylix.colors; {
    ".config/ulauncher/user-themes/theme/colours.css" = {
      text = with config.lib.stylix.colors; ''
        @define-color background #${base00-hex};
        @define-color current_line_background #${base01-hex};
        @define-color foreground #${base04-hex};
        @define-color foreground_lessimportant #${base05-hex};
        @define-color accent #${base09-hex};
        @define-color highlight #${base09-hex};
      '';
    };
    ".config/ulauncher/user-themes/theme/manifest.json" = {
      text = ''
              {
          "manifest_version": "1",
          "name": "stylix-theme",
          "display_name": "Stylix Theme",
          "extend_theme": "dark",
          "css_file": "theme.css",
          "css_file_gtk_3.20+": "theme-gtk-3.20.css",
          "matched_text_hl_colors": {
            "when_selected": "#${base0E-hex}",
            "when_not_selected": "#${base0E-hex}"
          }
        }
      '';
    };
    ".config/ulauncher/user-themes/theme/theme.css" = {
      text = ''
        @import "colours.css";
        /**
        * App Window
        */
        @define-color bg_color @background;
        @define-color window_bg @background;
        @define-color window_border_color darker(@background);
        @define-color prefs_backgroud @foreground;

                /**
                * Input
                */
         @define-color selected_bg_color @foreground;
         @define-color selected_fg_color @background;
         @define-color input_color @foreground;
         @define-color caret_color @foreground;

         /**
          * Result items
          */
         @define-color item_name @foreground;
         @define-color item_text @foreground_lessimportant;
         @define-color item_box_selected @current_line_background;
         @define-color item_text_selected @accent;
         @define-color item_name_selected @accent;
         @define-color item_shortcut_color @foreground;
         @define-color item_shortcut_shadow darker(@background);
         @define-color item_shortcut_color_sel @highlight;
         @define-color item_shortcut_shadow_sel darker(@item_box_selected);

         .app {
             background-color: @window_bg;
             border-color: @window_border_color;
         }

         .input {
             color: @input_color;
         }

         /**
          * Selected text in input
          */
         .input *:selected,
         .input *:focus,
         *:selected:focus {
             background-color: alpha (@selected_bg_color, 0.9);
             color: @selected_fg_color;
         }

         .item-text {
             color: @item_text;
         }
         .item-name {
             color: @item_name;
         }

         .selected.item-box {
             background-color: @item_box_selected;
             border-left: 1px solid @window_border_color;
             border-right: 1px solid @window_border_color;
         }
         .selected.item-box .item-text {
             color: @item_text_selected;
         }
         .selected.item-box .item-name {
             color: @item_name_selected;
         }
         .item-shortcut {
             color: @item_shortcut_color;
             text-shadow: 1px 1px 1px @item_shortcut_shadow;
         }
         .selected.item-box .item-shortcut {
             color: @item_shortcut_color_sel;
             text-shadow: 1px 1px 1px @item_shortcut_shadow_sel;
         }

         .prefs-btn {
             opacity: 0.8;
         }
         .prefs-btn:hover {
             background-color: @prefs_backgroud;
         }
      '';
    };
    ".config/ulauncher/user-themes/theme/theme-gtk-3.20.css" = {
      text = ''
        @import "colours.css";
        @import url("theme.css");

        .input {
            caret-color: @caret_color;
        }
        .selected.item-box {
            /* workaround for a bug in GTK+ < 3.20 */
            border: none;
        }
      '';
    };
  };
}
