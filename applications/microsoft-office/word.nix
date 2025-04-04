{
  home.file.".local/share/applications/my-applications/microsoft-office/word.desktop".text = ''
    [Desktop Entry]
    Name=Microsoft Word
    Icon=word
    Exec=flatpak run --command=bottles-cli com.usebottles.bottles run -b "Office 2016" -p "Microsoft Word"
    Comment=Document Editor
    GenericName=Document Editor
    Terminal=false
    Type=Application
    Categories=Office
    StartupNotify=true
  '';
}
