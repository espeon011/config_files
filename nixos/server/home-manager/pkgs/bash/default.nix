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
      flyline create-prompt-widget last-command-duration
      PS1='\e[01;32m\u@\h\e[00m : \e[01;34m\w\e[00m \n$ '
      RPS1=' (took FLYLINE_LAST_COMMAND_DURATION) \e[01;33m\t\n\e[00m'
      PS1_FILL='-'
      PROMPT_RULER=' '
    '';
  };
}
