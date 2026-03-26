{
  pkgs,
  userSettings,
  ...
}: {
  # Enables virtualisation
  virtualisation = {
    libvirtd = {
      # libvirtd allows for the creation of low level virtual machines
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        vhostUserPackages = with pkgs; [
          virtiofsd
        ];
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    distrobox # distrobox allows for the creation of terminal based virtual machines
  ];
  users.groups.libvirtd.members = ["${userSettings.username}"];
}
