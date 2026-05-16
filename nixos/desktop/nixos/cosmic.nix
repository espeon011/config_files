{ pkgs, ... }: {
  services = {
    displayManager = {
      cosmic-greeter.enable = true;
    };
    desktopManager = {
      cosmic.enable = true;
    };
  };
  environment.systemPackages = [
    pkgs.cosmic-icons
  ];
}
