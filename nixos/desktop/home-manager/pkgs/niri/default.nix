{ pkgs, ... }: {
  imports = [
    ./noctalia
  ];

  home.packages = [
    pkgs.niri
    pkgs.wl-clipboard
    pkgs.swww
    pkgs.pavucontrol
    pkgs.font-awesome
    pkgs.networkmanagerapplet
    # pkgs.fuzzel
    # pkgs.swaylock
    pkgs.thunar
    pkgs.tumbler
    pkgs.libnotify # for notify-send
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  # # 何なのかよくわかってない
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-wlr
  #   ];
  # };
}
