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
    btop
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
    fastfetch
    kdePackages.ktorrent
    docker-compose
  ];
}
