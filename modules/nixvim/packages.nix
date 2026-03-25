{pkgs-unstable, ...}: {
  home.packages = with pkgs-unstable; [
    alejandra
    gopls
    hclfmt
    markdown-oxide
    nixd
    nixfmt-rfc-style
    prettierd
    pyright
    basedpyright
    stylua
    yamllint
    yamlfmt
  ];
}
