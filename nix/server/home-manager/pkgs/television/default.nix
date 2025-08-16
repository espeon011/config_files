{...}: let
  # デフォルトの設定ファイルを配置するためのもの
  # television がアップデートされた場合ここも置き換える必要がある
  television-repo = builtins.fetchTarball {
    url = "https://github.com/alexpasmantier/television/archive/refs/tags/0.13.2.tar.gz";
    sha256 = "sha256:0bgw8n0ra4r86hs09msxp2by8q6xdc7l1s2nr6cqvc6pvm6r9gjj";
  };
in {
  programs.television = {
    enable = true;
  };

  xdg.configFile."television/config.toml".source = "${television-repo}/.config/config.toml";
  xdg.configFile."television/cable/env.toml".source = "${television-repo}/cable/unix/env.toml";
  xdg.configFile."television/cable/files.toml".source = "${television-repo}/cable/unix/files.toml";
  xdg.configFile."television/cable/dirs.toml".source = "${television-repo}/cable/unix/dirs.toml";
  xdg.configFile."television/cable/text.toml".source = "${television-repo}/cable/unix/text.toml";
  xdg.configFile."television/cable/fish-history.toml".source = "${television-repo}/cable/unix/fish-history.toml";

  imports = [
    ./nix-search-tv
  ];
}
