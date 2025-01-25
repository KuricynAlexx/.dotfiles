{ config, lib, pkgs, libs, ... }:
let 
  username = "alex";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  nix = {
    package = pkgs.nix;
    settings.extra-experimental-features = [ "nix-command" "flakes" ];
  };
  nixpkgs.config.allowUnfreePredicate = _: true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  imports =
    [ 
      ./user_modules/user_pkgs.nix
      ./user_modules/session.nix
      ./user_modules/shells.nix
      ./user_modules/git.nix
      ./user_modules/tmux.nix
      ./user_modules/vim.nix
      # ./user_modules/eww.nix
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    #".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/alex/etc/profile.d/hm-session-vars.sh
  #

  home.keyboard = {
    enable = true;
    layout = "us,ru";
    model = "pc104";
    options = "grp:alt_space_toggle";
    variant = "";
  };

  xresources.path = "$HOME/.Xresources";

  # store side-packages here:
  programs.vscode.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}