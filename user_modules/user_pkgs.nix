{ config, pkgs, ... }:

{

  # The home.packages option allows you to install Nix packages into your
  home.packages = with pkgs; [

    # env&tools
    gotop
    xorg.libX11
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    xorg.xbacklight
    picom
    pamixer
    bc

    # dev
    gcc
    gnumake
    nerdfonts
    electron

    # personal
    dropbox
    #discord
    obsidian

    # messangers
    telegram-desktop

    # browsers
    librewolf
    firefox

    # video-conference applications
    zoom-us 
    skypeforlinux

    # for eye carrying
    xflux-gui

    # for books
    zathura   
    #djvulibre

    # for 3d cv
    cloudcompare

    # science 
    mendeley

  ];
}
