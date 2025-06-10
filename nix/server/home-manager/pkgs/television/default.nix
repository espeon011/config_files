{...}: let
  # デフォルトの設定ファイルを配置するためのもの
  # television がアップデートされた場合ここも置き換える必要がある
  television-repo = builtins.fetchTarball {
    url = "https://github.com/alexpasmantier/television/archive/refs/tags/0.11.9.tar.gz";
    sha256 = "sha256:0jz3516v9203a1gsk7h8mmca0bcdhbmfbc5h0flx7ga0a0q3gs7n";
  };
in {
  programs.television = {
    enable = true;
  };

  xdg.configFile."television/config.toml".source = "${television-repo}/.config/config.toml";

  imports = [
    ./nix-search-tv
  ];
}
