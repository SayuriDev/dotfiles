{pkgs, ...}:
{
  home.packages = with pkgs; [
    legcord
  ];

  # # Change icon to discord default one
  # xdg.desktopEntries.vesktop = {
  #   name = "Vesktop";
  #   genericName = "Internet Messenger";
  #   icon = "discord";
  #   exec = "vesktop %U";
  #   categories = [ "Network" "InstantMessaging" "Chat" ];
  #   type = "Application";
  # };
  # # home.persistence."/persist".directories = [
  # #   ".local/share/Vesktop" # (not sure if right dir)
  # # ];
}