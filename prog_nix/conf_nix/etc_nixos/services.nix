{ config, pkgs, ... }:

{

  services.openssh.enable = true;

  services.flatpak.enable = true;

  programs.nix-ld.enable = true;

  programs.zsh.enable = true;

  programs.starship.enable = true;

  virtualisation.docker.enable = true;

  virtualisation.podman.enable = true;

}
