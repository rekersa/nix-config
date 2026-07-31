{
  ...
}:
{
  
   # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ]; 

  programs.dconf.enable = true;
}
