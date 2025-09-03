{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    gcc
    clang
    curl
    wget
    neovim
    google-chrome
    wezterm
    zsh
    starship
    git
    fzf
    htop
    bat
    eza
    rsync
    freerdp
    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    gimp3
    inkscape
  ];

}
