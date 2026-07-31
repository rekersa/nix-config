{
  config,
  pkgs,
  ...
}:
let
  configPath = "nix-config/home/term/neovim/nvim";
in
{
  programs.neovim = {
    enable = true;
    sideloadInitLua = true;

    extraPackages = with pkgs; [
      git
    ];
  };

  stylix.targets.neovim = {
     plugin = "mini.base16";
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/${configPath}";
}
