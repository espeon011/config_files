{pkgs, ...}: {
  imports = [
    ./fonts
    ./eza
    ./jaq
    ./git
    ./fish
    ./starship
    ./helix
    ./tmux
    ./zellij
    ./wezterm
    ./ghostty
    ./television
    ./yazi
    ./claude-code
  ];

  # The home.packages option allows you to install Nix packages into your environment.
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

    pkgs.uutils-coreutils
    pkgs.uutils-coreutils-noprefix
    pkgs.nh
    pkgs.nil
    # pkgs.nixd
    pkgs.nurl
    pkgs.alejandra
    pkgs.bat
    pkgs.diffnav
    pkgs.tailspin
    pkgs.ripgrep
    pkgs.fd
    pkgs.bottom
    pkgs.procs
    pkgs.amdgpu_top
    pkgs.nvtopPackages.amd
    pkgs.hexyl
    pkgs.heh
    pkgs.csvlens
    pkgs.jless
    pkgs.fastfetch
    pkgs.onefetch
    pkgs.codesnap
  ];
}
