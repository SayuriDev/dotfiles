{...}:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "escape"; # you might need to also enclose the key in quotes if it contains non-alphabetical symbols
          };
          otherlayer = {};
        };
      };
    };
};
}
