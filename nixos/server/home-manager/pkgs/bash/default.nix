{
  inputs,
  config,
  pkgs,
  ...
}: let
  flyline = inputs.flyline.packages.${pkgs.stdenv.hostPlatform.system}.flyline;
  libflyline = "${flyline}/lib/libflyline${pkgs.stdenv.hostPlatform.extensions.sharedLibrary}";
in {
  home.packages = [flyline];
  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.stateHome}/bash/history";
    initExtra = ''
      enable -f ${libflyline} flyline
    '';
  };
}
