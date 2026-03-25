{
  pkgs,
  userSettings,
  ...
}: {
  virtualisation = {
    libvirtd = {
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
    distrobox
  ];
  users.groups.libvirtd.members = ["${userSettings.username}"];
}
