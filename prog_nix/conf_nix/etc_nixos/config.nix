{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.starship.enable = true;

  programs.zsh = {
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  # Pick one
    virtualisation.docker.enable = true;
    virtualisation.podman.enable = true;
}
