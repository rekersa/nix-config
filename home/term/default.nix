{
  config,
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    settings = {
      shell = "fish";
    };
  };

  programs.fish = {
    enable = true;
    shellInit = "starship init fish | source";
  };

  programs.starship.enable = true;
}
