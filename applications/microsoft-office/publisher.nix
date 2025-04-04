{
  home.file.".local/share/applications/my-applications/microsoft-office/publisher.desktop".text = ''
    [Desktop Entry]
    Name=Microsoft Publisher
    Icon=publisher
    Exec=flatpak run --command=bottles-cli com.usebottles.bottles run -b "Office 2016" -p "Microsoft Publisher"
    Comment=Publishing Application
    GenericName=Publishing Application
    Terminal=false
    Type=Application
    Categories=Office
    StartupNotify=true
  '';
}
