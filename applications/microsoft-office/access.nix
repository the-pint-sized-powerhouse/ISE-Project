{
  home.file.".local/share/applications/my-applications/microsoft-office/access.desktop".text = ''
    [Desktop Entry]
    Name=Microsoft Access
    Icon=access
    Exec=flatpak run --command=bottles-cli com.usebottles.bottles run -b "Office 2016" -p "Microsoft Access"
    Comment=Database Engine
    GenericName=Database Engine
    Terminal=false
    Type=Application
    Categories=Office
    StartupNotify=true
  '';
}
