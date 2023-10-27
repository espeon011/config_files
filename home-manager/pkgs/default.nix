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
  ];

  home.packages = [
    pkgs.nil
    pkgs.erdtree
    pkgs.bat
    pkgs.ripgrep
    pkgs.fd
    pkgs.yazi
    pkgs.bottom
    pkgs.procs
    pkgs.amdgpu_top
    pkgs.hexyl
    pkgs.jq
    pkgs.jaq
    pkgs.jless
    pkgs.typst
    pkgs.neofetch
    pkgs.onefetch
    pkgs.asciiquarium

    pkgs.mplus-outline-fonts.githubRelease
    pkgs.vscode
    pkgs.blender-hip
    pkgs.microsoft-edge
  ];
}