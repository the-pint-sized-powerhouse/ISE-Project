{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    lm_sensors
  ];
}
