{ pkgs, ... }: {
  imports = [
    ./eza
    ./git
    ./fish
    ./starship
    ./helix
    ./tmux
    ./zellij
    ./wezterm
    ./ghostty
  ];

  home.packages = [
    pkgs.nh
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.bat
    pkgs.tailspin
    pkgs.ripgrep
    pkgs.fd
    pkgs.serie
    pkgs.television
    pkgs.yazi
    pkgs.bottom
    pkgs.procs
    pkgs.amdgpu_top
    pkgs.hexyl
    pkgs.heh
    pkgs.csvlens
    pkgs.jq
    pkgs.jaq
    pkgs.jless
    pkgs.fastfetch
    pkgs.onefetch
    pkgs.codesnap

    pkgs.mplus-outline-fonts.githubRelease
    pkgs.vscode
    pkgs.spacedrive
  ];
}
