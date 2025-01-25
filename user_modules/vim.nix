{ config, pkgs, ... }:

{
  programs.neovim = {
    enable =true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      # --- standard --- #
      vim-airline
      nvim-treesitter

      nerdtree
      nerdtree-git-plugin
      vim-nerdtree-syntax-highlight

      elixir-tools-nvim

      # multicursor
      # "smoka7/multicursors.nvim"
      # --- # 
      coc-nvim
      coc-python

      lazy-nvim
      nvim-autopairs
      nvim-lspconfig

      nvchad
      # nvchad-ui
      # parinfer
      # nvim-parinfer

      gitsigns-nvim

      # languages
      yuck-vim

    ];
    extraPackages = with pkgs; [
      (python3.withPackages (ps: with ps; [
        # black
	python-lsp-server
	pylsp-mypy
	pyls-isort
	python-lsp-black
        flake8
      ]))
    ];
    extraPython3Packages = (ps: with ps; [
      jedi
    ]);
    #configure = {
    # customRC = ''
    #   nnoremap <leader>n :NERDTreeFocus<CR>
    #   nnoremap <C-n> :NERDTree<CR>
    #   nnoremap <C-t> :NERDTreeToggle<CR>
    #   nnoremap <C-f> :NERDTreeFind<CR>
    # '';
    #};
  };

  # xdg.configFile."nvim/coc-settings.json".text = builtins.readFile ~/.dotfiles/user_modules/my-coc-settings.json;
}
