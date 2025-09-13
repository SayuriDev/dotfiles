{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      editor = {
        mouse = false;
        middle-click-paste = false;
        line-number = "relative";
        clipboard-provider = "wayland";
      };
      editor.whitespace = {
        render = { tab = "all"; };
        character = { tab = "→"; tabpad = "·"; };
      };
      editor.soft-wrap = { enable = true; max-wrap = 50; };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        language-servers = [ "nil" ];
      }
      {
        name = "qml";
        auto-format = true;
        formatter.command = "${pkgs.kdePackages.qtdeclarative}/bin/qmlformat";
        language-servers = [ "qmlls" ];
      }
      {
        name = "rust";
        auto-format = true;
        formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
        language-servers = [ "rust-analyzer" ];
      }
      {
        name = "python";
        auto-format = true;
        formatter.command = "${pkgs.black}/bin/black";
        language-servers = [ "pyright" ];
      }
      {
        name = "typescript";
        auto-format = true;
        formatter.command = "${pkgs.prettier}/bin/prettier";
        language-servers = [ "typescript-language-server" ];
      }
      {
        name = "javascript";
        auto-format = true;
        formatter.command = "${pkgs.prettier}/bin/prettier";
        language-servers = [ "typescript-language-server" ];
      }
      {
        name = "json";
        auto-format = true;
        formatter.command = "${pkgs.jq}/bin/jq";
        language-servers = [ "vscode-json-languageserver" ];
      }
      {
        name = "markdown";
        auto-format = true;
        formatter.command = "${pkgs.prettier}/bin/prettier";
        language-servers = [ "marksman" ];
      }
    ];

    languages.language-server = {
      nil = { command = "${pkgs.nil}/bin/nil"; };
      rust-analyzer = { command = "${pkgs.rust-analyzer}/bin/rust-analyzer"; };
      pyright = { command = "${pkgs.pyright}/bin/pyright-langserver"; args = [ "--stdio" ]; };
      typescript-language-server = {
        command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
        args = [ "--stdio" ];
      };
      vscode-json-languageserver = {
        command = "${pkgs.nodePackages.vscode-json-languageserver}/bin/vscode-json-languageserver";
        args = [ "--stdio" ];
      };
      marksman = { command = "${pkgs.marksman}/bin/marksman"; };
    };
  };
}
