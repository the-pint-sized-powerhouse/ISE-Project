{
  # adds indent guides
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings.scope.enabled = false;
  };
}
