{ config, lib, pkgs, ... }:
let
  st = pkgs.st.overrideAttrs (old: {
    src = /home/alex/.config/st;
    nativeBuildInputs = with pkgs; [
      pkg-config
      ncurses # for tic command
      gnumake
      xorg.libX11.dev
      xorg.libXft
      imlib2
      xorg.libXinerama
      font-awesome
      fontconfig
      nerdfonts
      freetype
    ];
  });
  # libinput-gestures = pkgs.libinput-gestures.overrideAttrs (old: {
  # src = /home/alex/.config/libinput-gestures;
  # });
in
{
  imports =
    [ 
      # ./rust/rustup.default.nix
    ];
  
  environment.systemPackages = with pkgs; [
    # enviroment
    ly
    bspwm

    # WMs and controllers
    libinput 
    libinput-gestures
    wmctrl # window manager control (more info:  https://habr.com/ru/companies/ruvds/articles/532342/ )
    ydotool
    xdotool

    vim 
    neovim
    wget

    # desktop attrs:
    polybar # upper toolbar
    dmenu   # popup console
    picom   # ?

    # eww and deps
    eww     # custmizable widgets
    rustup
    cargo
    libglibutil
    glib
    glibc

    albert # search engine
    nitrogen
    gtk3
    gtk-engine-murrine # for everforest-gtk
    xclip     # clipboard provider
    rofi
    pywal
    calc
    networkmanager_dmenu
    pfetch

    # system apps:
    st        # the terminal
    zsh       # shell 
    htop      # system controler
    mpv       # video-viewer
    nsxiv     # image-viewer
    vifm      # console file manager
    yazi      # console file manager. see more: https://github.com/sxyazi/yazi
    gnome.nautilus  # alternative file manager
    gnome.gnome-tweaks
    neofetch

    # minors for regular life
    killall
    mpd 	# music
    font-manager

    pulseaudio 		# audio 
    xorg.xbacklight 	# brightness
    light		# brightness lib | alternation
    rofi-screenshot 	# screenshots
    tmux

    # -= user's ones =-
    ueberzugpp 		# image viewer in terminal (replacement for ueberzug)

    #zoxide    # advanced cd command. see more: https://github.com/ajeetdsouza/zoxide
    fzf

    # minimum python
    python311Full
    python311Packages.pip
    python311Packages.virtualenv
    micromamba

    # dev
    cmake
    meson
    ninja
    docker
    lz4
    gcc
    libgcc
    gcc-arm-embedded-9
    git

    # gl
    glxinfo
    # virtualglLib

    # vpn
    #openvpn3
    mullvad
    mullvad-vpn
    geoip
    geoipWithDatabase

    # generally for system
    yaml-cpp
    p7zip

    libstdcxx5
    gnustep.stdenv
    doas

  ];

  # for fast development
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    silent = false;
    loadInNixShell = true;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
}
