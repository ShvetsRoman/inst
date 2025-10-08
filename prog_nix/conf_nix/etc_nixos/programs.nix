{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    gcc
    clang
    curl
    wget
    unzip
    mc
    yazi
    neovim
    wl-clipboard
    xclip
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
    vlc
    deadbeef
    neofetch
    kdePackages.ktorrent
    docker-compose
  ];
}
