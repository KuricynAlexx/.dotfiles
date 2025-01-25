# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./modules/hardware-configuration.nix
      ./modules/system_pkgs.nix
      ./modules/xserver.nix
      ./modules/periphery.nix
      ./modules/interface.nix
      ./modules/laptop.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "snore"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  # garbage coolector for nixos files
  nix.gc = {
    automatic = true;
    dates = "weekly"; # When to run the garbage collector
    # Arguments to pass to nix-collect-garbage
    options = "--delete-older-than 30d";
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  #i18n.defaultLocale = "en_US.UTF-8";
  #console = {
  #  font = "Lat2-Terminus16";
  #  keyMap = "us";
  #  useXkbConfig = true; # use xkb.options in tty.
  #};

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # enable opengl # On CPU
  hardware.opengl.enable = true;

  # high-dpi video [unstable, check it later]
  # hardware.video.hidpi.enable = true;

  # Set qt style like gpk stype
  qt.enable = true;
  qt.platformTheme = "qt5ct";
  qt.style = "plastique";
 
  #security = {
  #  pam.oath.enable = false;
  #};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "input" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$y$j9T$KBsfGHbHjRYqCpfAh80IH1$V9k9IYvZvUaww8HAkpMPcixmCvko0oOkqUPd1quKSrB";
    packages = [
      pkgs.tree
    ];
  };

  # List packages installed in system profile. To search, run:
  # nix search wget

  services.mullvad-vpn.enable = true;

  environment.variables = {
    EDITOR = "nvim";
  };

  virtualisation = {
    docker.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  programs.light.enable = true;
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  #system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

