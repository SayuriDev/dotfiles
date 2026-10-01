# based on https://crescentro.se/posts/windows-vm-nixos/ <3.

{ pkgs, config, ... }:
{
  # Set up virtualisation
  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      swtpm.enable = true;
    };
  };

  # Enable USB redirection
  virtualisation.spiceUSBRedirection.enable = true;

  users.groups.libvirtd.members = [ "${config.vars.username}" ];
  users.groups.kvm.members = [ "${config.vars.username}" ];

  environment.systemPackages = with pkgs; [
    gnome-boxes # VM management
    dnsmasq # VM networking
    phodav # Share files with guest VMs
    spice-vdagent # Clipboard sharing
  ];

}
