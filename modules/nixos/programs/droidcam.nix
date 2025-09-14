{ pkgs, ... }:
{
  programs.droidcam = {
    enable = true;
  };

  # Droidcam kernel modules
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
  boot.extraModprobeConfig = ''
  options v4l2loopback devices=1 video_nr=0 card_label="DroidCam" exclusive_caps=1
'';
}
