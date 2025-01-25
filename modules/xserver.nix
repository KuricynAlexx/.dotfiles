{ config, lib, pkgs, stdenv, fetchFromGitHub, ... }:
{

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # WM
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
      ];
    };
    # DM
    displayManager = {
      defaultSession = "none+awesome";
      sddm.enable = true;
      sddm.theme = "ssdm-sugar-dark-theme";
    };

    videoDrivers = [ "modesetting" ];
    
    # global DPI
    dpi = 150; # the same as ppi, 264 by default
    # dpi = 264; # original
    resolutions = [
      {
        x = 3120; # orig
        y = 2080; # orig
      }
    ];
    # layout params
    layout = "us,ru";
    xkbVariant = "";
    xkbModel = "pc104";
    xkbOptions = "grp:alt_space_toggle";

    # libinput
    libinput.enable = true;

    libinput.mouse = {
      accelProfile = "adaptive";
      accelSpeed = "0.8";
      scrollMethod = "twofinger";
    };
    libinput.touchpad = {
      accelProfile = "adaptive";
      accelSpeed = "1.2";
      scrollMethod = "twofinger";
      tapping = true;
    };

  };



}
