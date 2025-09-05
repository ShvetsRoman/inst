{ config, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.flatpak.enable = true;
}
