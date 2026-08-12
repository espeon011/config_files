{ pkgs, ... }: {
  imports = [
    ./fonts
    ./eza
    ./git
    ./fish
    ./starship
    ./helix
    ./tmux
    ./zellij
    ./wezterm
    ./ghostty
    ./niri
    ./television
    ./yazi
    ./zen
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

    pkgs.nh
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.bat
    pkgs.diffnav
    pkgs.tailspin
    pkgs.ripgrep
    pkgs.fd
    pkgs.serie
    pkgs.yazi
    pkgs.bottom
    pkgs.procs
    pkgs.nvtopPackages.intel
    pkgs.hexyl
    pkgs.heh
    pkgs.csvlens
    pkgs.jaq
    pkgs.jless
    pkgs.fastfetch
    pkgs.onefetch

    # GUI App
    pkgs.thunderbird
    pkgs.zathura
    pkgs.zotero
    pkgs.slack
    pkgs.obs-studio

    # お試し
    pkgs.kdePackages.dolphin
    pkgs.mprocs
    pkgs.acpi # バッテリー情報確認
    # pkgs.noisetorch # 起動しない
  ];
}
