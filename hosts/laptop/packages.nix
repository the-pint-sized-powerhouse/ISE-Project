{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages =
    (with pkgs; [
      brightnessctl
    ])
    ++ (with pkgs-unstable; [
      lm_sensors
    ]);
}
