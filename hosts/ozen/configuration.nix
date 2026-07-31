{
  ...
}:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
      ../common/users.nix
      ../common/boot.nix
      ../common/time-language.nix
      ../common/networking.nix
      ../common/gfx
      ../common/gfx/amd.nix
      ../common/audio.nix
      ../common/gaming.nix
    ];

  networking.hostName = "ozen"; # Define your hostname.

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
