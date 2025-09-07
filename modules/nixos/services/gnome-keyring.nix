{pkgs, ...}:
{
programs.seahorse.enable = true;
services.gnome.gnome-keyring.enable = true;
services.dbus.packages = [ pkgs.gnome-keyring pkgs.gcr ];
}