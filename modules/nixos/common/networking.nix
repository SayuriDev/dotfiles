{
  networking = {

    networkmanager = {
      enable = true;
      dns = "none";
      };

    # These options are unnecessary when managing DNS ourselves
    useDHCP = false;
    dhcpcd.enable = false;
    nameservers = [
      "1.1.1.1"   # Cloudflare
      "1.0.0.1"   # Cloudflare
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [ 123 ];
    };
  };
}