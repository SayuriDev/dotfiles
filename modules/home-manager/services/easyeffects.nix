{ ... }:
{
  services.easyeffects = {
    enable = true;
    preset = "adam-t7v";
  };

  xdg.dataFile."easyeffects/output/adam-t7v.json".source = ../../../assets/audio/adam-t7v.json;
}
