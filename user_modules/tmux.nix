{ config, pkgs, ... }:

{

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    plugins = with pkgs; [
      tmuxPlugins.cpu
      #tmuxPlugins.better-mouse-mode
      tmuxPlugins.sidebar
      #tmuxPlugins.nerd
      # tmuxPlugins.colorful-tmux
      # tokyo-night-tmux
    ];
    extraConfig = ''
    set -g status-keys vi
    set -g mode-keys 	vi

    # remap prefix from 'C-b' to 'ALT+e' (META=ALT)
    unbind C-b
    set-option -g prefix M-e
    bind-key M-e send-prefix

    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

    set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
    set -g @tree-command f
    bind | split-window -h
    bind - split-window -v
    unbind '"'
    unbind %

    # tmux colorful
    # set -g @tmux_colorful_color_scheme 'https://coolors.co/30362f-625834-a59132-fffbdb-da7422'
    set -g default-terminal "tmux-256color"
    '';
  };
}

