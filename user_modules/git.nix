{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "AlexTheSnore";
    userEmail = "KuricynAlexx@gmail.com";
    package = pkgs.gitFull;
    aliases = {
      ci = "commit";
    };
    extraConfig = {
      credential = {
        helper = "libsecret";
      };
    };
  };
}

