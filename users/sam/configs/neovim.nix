{ config, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      gruvbox-material
      mini-nvim
      nvim-tree-lua
      nvim-web-devicons
      gitsigns-nvim
      telescope-nvim

      # LSP Plugins
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      trouble-nvim
      nvim-autopairs
      comment-nvim

      # completions
      nvim-cmp
      luasnip
      cmp-cmdline
      cmp-path
      cmp-nvim-lua
      cmp-nvim-lsp

      # UI Plugins
      noice-nvim
      nvim-notify
      nui-nvim
      which-key-nvim
      lualine-nvim
      bufferline-nvim
    ];

    extraPackages = with pkgs; [
      clang-tools
      lua-language-server
      python311Packages.python-lsp-server
    ];

    extraLuaConfig = builtins.readFile ./nvim/init.lua; };
}
