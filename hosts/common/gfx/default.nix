{
  pkgs,
  ...
}:
{
  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    lact
    pciutils
  ];
}
