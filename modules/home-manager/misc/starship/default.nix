{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		starship
	];

  home.file.".config/starship/starship.toml".source = ./starship.toml;

  programs.starship = {
    enable = true;
		enableFishIntegration = true;
  };

  stylix.targets.starship.enable = false;

}
