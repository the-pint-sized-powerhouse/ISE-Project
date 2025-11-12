{
  gtk = {
    enable = true;
  };
  stylix.targets.gtk.extraCss = ''
    window.background { border-radius: 0; }
    .ssd headerbar * {
      margin-top: -100px;
    }
    .ssd headerbar.titlebar,
    .ssd headerbar.titlebar button.titlebutton {
      border: none;
      font-size: 0;
      min-height: 0;
      padding: 0;
    }
  '';
}
