{ config, lib, pkgs, ... }:

{

  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome
    noto-fonts
    noto-fonts-cjk
    noto-fonts-cjk-sans
    noto-fonts-emoji
    material-icons		# icons for system
    material-symbols		# symbols
    material-design-icons 	# icons as fonts

  ];

  services.picom = {
    enable = false;
  };
}
