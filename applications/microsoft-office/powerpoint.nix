{
  home.file.".local/share/applications/my-applications/microsoft-office/powerpoint.desktop".text = ''
    [Desktop Entry]
    Name=Microsoft PowerPoint
    Icon=powerpoint
    Exec=flatpak run --command=bottles-cli com.usebottles.bottles run -b "Office 2016" -p "Microsoft PowerPoint"
    Comment=Slideshow Editor
    GenericName=Slideshow Editor
    Terminal=false
    Type=Application
    Categories=Office
    StartupNotify=true
  '';
}
