{pkgs, ...}:
{
  programs.nixvim = {
    enable = true;

    plugins = { 
      lualine.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      lspconfig.enable = true;
      blink-cmp.enable = true;
      };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      };
    };
}