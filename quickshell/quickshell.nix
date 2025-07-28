{ config, pkgs, ... }:

{
  systemd.user.services.quickshell = {
    Unit = {
      Description = "Quickshell UI";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.quickshell}/bin/quickshell --config /home/sayu/dotfiles/quickshell/main.qml";
      Restart = "on-failure";
    };
  };
}