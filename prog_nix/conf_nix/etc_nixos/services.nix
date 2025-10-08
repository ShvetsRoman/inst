{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  programs.starship.enable = true;

  virtualisation.docker.enable = true;

  virtualisation.podman.enable = true;

  services.openssh.enable = true;

  services.flatpak.enable = true;

}
