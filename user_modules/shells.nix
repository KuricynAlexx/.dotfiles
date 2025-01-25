{ config, pkgs, ... }:

{

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      vim= "nvim";
      ".." = "cd ..";
      gcc-ar="ar --plugin=/path/to/liblto_plugin.so";
      ns="nix-shell";
      ".duf"="du -h --max-depth=1 | sort -h -r"; # includes .hidden-files
      duf="du -h -s ./* | sort -h -r"; # excludes .hidden-files
    };
    bashrcExtra = ''
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/nix/store/kmsvkjrxavn6v8mjv5a7av8l6jldc42l-micromamba-1.4.4/bin/micromamba";
export MAMBA_ROOT_PREFIX="...";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f ".../etc/profile.d/micromamba.sh" ]; then
        . ".../etc/profile.d/micromamba.sh"
    else
        export  PATH=".../bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
MAMBA_ROOT_PREFIX=~/micromamba

eval "$(direnv hook bash)"
'';
  };
}


