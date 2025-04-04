{ config, ... }:

{
  hardware = {
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
    openrazer = {
      enable = true;
    };
  };
}
