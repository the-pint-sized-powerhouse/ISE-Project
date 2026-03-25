{
  programs.nixvim.plugins.colorizer = {
    enable = true;
    autoLoad = true;
    settings = {
      filetypes = {
        __unkeyed-1 = "*";
      };
      user_default_options = {
        RGB = true;
        RRGGBB = true;
        names = true;
        RRGGBBAA = true;
        rgb_fn = true;
        hsl_fn = true;
        css = true;
        css_fn = true;
        mode = "background";
      };
    };
  };
}
