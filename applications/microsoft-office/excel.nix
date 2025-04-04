{
  home.file.".local/share/applications/my-applications/microsoft-office/excel.desktop".text = ''
    [Desktop Entry]
    Name=Microsoft Excel
    Icon=excel
    Exec=flatpak run --command=bottles-cli com.usebottles.bottles run -b "Office 2016" -p "Microsoft Excel"
    Comment=Spreadsheet Editor
    GenericName=Spreadsheet Editor
    Terminal=false
    Type=Application
    Categories=Office
    StartupNotify=true
  '';
}
