{ ... }: {
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = (import ./user.nix).name;
  home.homeDirectory = (import ./user.nix).directory;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    LANG = "ja_JP.UTF-8";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # User specific configurations.
  imports = [
    ./pkgs
    ./files
    ./xdg-user-dirs.nix
  ];
}
