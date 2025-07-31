{config, pkgs, ...}: {
  virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.guest.enable = true; ### Disabled due to long compile times
  # virtualisation.virtualbox.guest.draganddrop = true;
   users.extraGroups.vboxusers.members = [ "sayu" ];
}