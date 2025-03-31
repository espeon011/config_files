{pkgs, ...}: {
  imports = [
    ./eza
    ./jaq
    ./git
    ./fish
    ./starship
    ./helix
    ./tmux
    # ./zellij # ログイン時に起動してしまうのでオフ
    ./wezterm
    ./ghostty
  ];

  home.packages = [
    pkgs.nh
    pkgs.nil
    # pkgs.nixd
    pkgs.nurl
    pkgs.alejandra
    pkgs.bat
    # pkgs.tailspin # エラーになるので一旦除外
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
    pkgs.jless
    pkgs.fastfetch
    pkgs.onefetch
    pkgs.codesnap

    pkgs.mplus-outline-fonts.githubRelease
    pkgs.vscode
    pkgs.spacedrive
  ];
}
