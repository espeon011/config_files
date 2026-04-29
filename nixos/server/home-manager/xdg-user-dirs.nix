{config, ...}: let
  inherit (config.home) homeDirectory;
in {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "${homeDirectory}/Desktop";
    documents = "${homeDirectory}/Documents";
    download = "${homeDirectory}/Downloads";
    music = "${homeDirectory}/Music";
    pictures = "${homeDirectory}/Pictures";
    projects = "${homeDirectory}/Projects";
    publicShare = "${homeDirectory}/Public";
    templates = "${homeDirectory}/Templates";
    videos = "${homeDirectory}/Videos";
  };
}
