# original article: https://nixos.wiki/wiki/Laptop
{ config, lib, pkgs, ... }:

{
  /*
  NixOS has several tools to help you manage the power on your system and 
    it also has a stock feature for powerManagement. 
  This tool is compatible with the other tools mentioned, 
  but the other tools may overwrite this setting.
  */
  powerManagement = {
    enable = true;
    powertop.enable = true; # power analysis tool
  };


  # Thermald proactively prevents overheating on Intel CPUs and works well with other tools
  services.thermald.enable = true;

  # tlp
  services.tlp = {
      enable = true;
      settings = {
	# on ac:
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
	
	# on bettery:
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        # cpu performances
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 96;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 80;

       # Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 90; # 90 and above it stops charging

      };
  };

}
  
