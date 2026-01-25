{ pkgs, ... }: {
  imports = [
    ./eza
    ./git
    ./fish
    ./starship
    ./helix
    ./tmux
    ./zellij # ターミナル起動時に自動で起動してしまうためオフ
    ./wezterm
    ./ghostty
    ./niri
    ./television
    ./yazi
    ./zen
  ];

  home.packages = [
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
    pkgs.mplus-outline-fonts.githubRelease
    pkgs.firefox-devedition
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
