{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      lspconfig.enable = true;
      fugitive.enable = true;
      neo-tree.enable = true;
      notify.enable = true;
      blink-cmp = {
        enable = true;
        settings.sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };
    };

    lsp.servers = {
      "*" = {
        settings = {
          capabilities.textDocument.semanticTokens = {
            multilineTokenSupport = true;
          };
          root_markers = [
            ".git"
          ];
        };
      };

      ts_ls = {
        enable = true;
        settings = {
          root_markers = [
            "package.json"
            "tsconfig.json"
            "jsconfig.json"
          ];
        };
      };
      lua_ls.enable = true;
      cssls.enable = true;
      eslint.enable = true;
      html.enable = true;
      lsp_ai.enable = true;
      marksman.enable = true;
      nixd.enable = true;
      rust_analyzer.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
  };
}
