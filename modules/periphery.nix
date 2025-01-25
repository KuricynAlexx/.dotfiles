{ config, lib, pkgs, ... }:

{
  # auto mount / unmount
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.daemon.config = {
    daemonize=true;
  };

  # audio
  services.mpd = {
    enable = true;
    musicDirectory = "/home/alex/Media/Music";
    extraConfig = ''
      audio_output {
      type "alsa"
      name "My ALSA"
      device			"hw:0,0"	# optional 
      format			"44100:16:2"	# optional
      mixer_type		"hardware"
      mixer_device		"default"
      mixer_control		"PCM"
    }
    '';

    # Optional:
    network.listenAddress = "any"; # if you want to allow non-localhost connections
    startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };

}

