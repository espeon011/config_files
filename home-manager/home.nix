{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "<your username>";
  home.homeDirectory = "/home/<your username>";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    pkgs.helix
    pkgs.git
    pkgs.exa
    pkgs.erdtree
    pkgs.bat
    pkgs.ripgrep
    pkgs.fd
    pkgs.tmux
    pkgs.zellij
    pkgs.starship
    pkgs.bottom
    pkgs.procs
    pkgs.amdgpu_top
    pkgs.hexyl
    pkgs.jaq
    pkgs.jless
    pkgs.typst
    pkgs.neofetch
    pkgs.onefetch
    pkgs.asciiquarium

    pkgs.wezterm
    pkgs.mplus-outline-fonts.githubRelease
    pkgs.vscode
    pkgs.blender-hip
    pkgs.microsoft-edge
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/<your username>/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
    LANG = "ja_JP.UTF-8";
    COLORTERM = "truecolor";
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # User specific configurations.
  programs = {
    exa = import ./pkgs/exa;
    git = import ./pkgs/git;
    fish = import ./pkgs/fish;
    starship = import ./pkgs/starship;
    helix = import ./pkgs/helix;
    tmux = import ./pkgs/tmux;
    zellij = import ./pkgs/zellij;
    wezterm = import ./pkgs/wezterm;
  };
}
