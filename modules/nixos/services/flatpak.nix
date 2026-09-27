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
      "org.vinegarhq.Sober"
    ];
  };
}
