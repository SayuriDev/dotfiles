{pkgs, ...}:
{
  home.packages = with pkgs; [
    vesktop
  ];


  # home.persistence."/persist".directories = [
  #   ".local/share/Vesktop" # (not sure if right dir)
  # ];
}