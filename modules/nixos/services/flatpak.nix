{ ... }:
{
  services.flatpak = {
    enable = true;
    update.onActivation = false;

    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };

    packages = [
      "com.usebottles.bottles"
      "com.heroicgameslauncher.hgl"
      "org.vinegarhq.Sober"
    ];
  };
}
