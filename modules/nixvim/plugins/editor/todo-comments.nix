{config, ...}: {
  programs.nixvim.plugins.todo-comments = with config.lib.stylix.colors; {
    enable = true;
    settings = {
      colors = {
        error = [
          "DiagnosticError"
          "ErrorMsg"
          "#${base0E-hex}"
        ];
        warning = [
          "DiagnosticWarn"
          "WarningMsg"
          "#${base0A-hex}"
        ];
        info = [
          "DiagnosticInfo"
          "#${base0A-hex}"
        ];
        default = [
          "Identifier"
          "#${base09-hex}"
        ];
        test = [
          "Identifier"
          "#${base0B-hex}"
        ];
      };
    };
  };
}
