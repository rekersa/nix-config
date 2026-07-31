{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    wl-clipboard
    wlr-randr
    wev
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      #color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      #name = "Adwaita-dark";
      #package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
