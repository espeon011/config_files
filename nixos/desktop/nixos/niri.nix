{ ... }: {
  # services.displayManager = {
  #   sddm = {
  #     enable = true;
  #     wayland.enable = true;
  #   };
  #   defaultSession = "niri";
  # };
  services.displayManager = {
    cosmic-greeter.enable = true;
    defaultSession = "niri";
  };

  programs.niri.enable = true;

  # environment.sessionVariables = {
  #   # Electron 使用アプリ用環境変数
  #   NIXOS_OZONE_WL = "1";
  # };
}
