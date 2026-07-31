{
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.mangowm.hmModules.mango
    ./wayland.nix
    ./noctalia
  ];

  wayland.windowManager.mango = {
    enable = true;

    settings = {
      exec-once = [
        "noctalia"
      ];
      exec = [
        "dbus-update-activation-enviroment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=mango"
      ];
      bind = [
        # Core
        "SUPER,m,quit"
        "SUPER,r,reload_config"
        "ALT,q,killclient"

        # Window management
        "ALT,Tab,focusstack,next"
        "ALT,h,focusdir,left"
        "ALT,l,focusdir,right"
        "ALT,k,focusdir,up"
        "ALT,j,focusdir,down"

        "SHIFT+ALT,Left,resizewin,-10,0"
        "SHIFT+ALT,Right,resizewin,10,0"
        "CTRL+ALT,Left,resizewin,-100,0"
        "CTRL+ALT,Right,resizewin,100,0"

        "SHIFT+ALT,h,exchange_client,left"
        "SHIFT+ALT,l,exchange_client,right"
        "SHIFT+ALT,k,exchange_client,up"
        "SHIFT+ALT,j,exchange_client,down"

        "SUPER,f,togglefullscreen"

        # Tag management
        "SUPER,1,view,1,0"
        "SUPER,2,view,2,0"
        "SUPER,3,view,3,0"
        "SUPER,4,view,4,0"
        "SUPER,5,view,5,0"
        "SUPER,6,view,6,0"
        "SUPER,7,view,7,0"
        "SUPER,8,view,8,0"
        "SUPER,9,view,9,0"

        "SUPER,h,viewtoleft,0"
        "SUPER,l,viewtoright,0"

        # Widget binds
        ## Noctalia
        ### Core binds
        "SUPER,space,spawn,noctalia msg panel-toggle launcher"
        "SUPER,s,spawn,noctalia msg panel-toggle control-center"
        "SUPER,comma,spawn,noctalia msg settings-toggle"
        ### Media keys
        "NONE,XF86AudioRaiseVolume,spawn,noctalia msg volume-up"
        "NONE,XF86AudioLowerVolume,spawn,noctalia msg volume-down"
        "NONE,XF86AudioMute,spawn,noctalia msg volume-mute"
        "NONE,XF86AudioPause,spawn,noctalia msg media pause"
        "NONE,XF86AudioPlay,spawn,noctalia msg media play"
        "NONE,XF86AudioNext,spawn,noctalia msg media next"
        "NONE,XF86AudioPrev,spawn,noctalia msg media previous"
         
        "ALT,Return,spawn,kitty"
      ];
      monitorrule = [
        "name:^DP-1$,width:2560,height:1440,refresh:240"
      ];

      bordercolor = "0x${config.lib.stylix.colors.base01}ff";
      focuscolor = "0x${config.lib.stylix.colors.base03}ff";

      borderpx = 3;
      gappih = 5;
      gappiv = 5;
      gappoh = 5;
      gappov = 5;
    };
  };
}
