{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = (builtins.fromTOML (builtins.readFile (./. + "/settings.toml")));
  };
}
