{ config, pkgs, ... }:

{
  # systemd.user.services.quickshell = {
  #   enable = true;
  #   description = "Quickshell UI";
  #   wantedBy = [ "graphical-session.target" ];

  #   serviceConfig = {
  #     ExecStart = "${pkgs.quickshell}/bin/quickshell --config /home/sayu/dotfiles/home-manager/quickshell/main.qml";
  #     Restart = "on-failure";
  #   };
  # };

  # environment.systemPackages = [ pkgs.quickshell ];
}
