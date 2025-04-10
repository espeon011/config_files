# nixpkgs にない catppuccin テーマを fish に設定するためのもの
# see: https://www.reddit.com/r/NixOS/comments/18xgvqf/how_to_set_catppuccin_theme_for_fish_using/
# このファイルではテーマファイルを配置するだけ.
{pkgs, ...}: let
  catppuccin-fish = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
    hash = "sha256-Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
  };

  filenameFrappe = "Catppuccin Frappe.theme";
  filenameLatte = "Catppuccin Latte.theme";
  filenameMacchiato = "Catppuccin Macchiato.theme";
  filenameMocha = "Catppuccin Mocha.theme";
in {
  xdg.configFile."fish/themes/${filenameFrappe}".source = "${catppuccin-fish}/themes/${filenameFrappe}";
  xdg.configFile."fish/themes/${filenameLatte}".source = "${catppuccin-fish}/themes/${filenameLatte}";
  xdg.configFile."fish/themes/${filenameMacchiato}".source = "${catppuccin-fish}/themes/${filenameMacchiato}";
  xdg.configFile."fish/themes/${filenameMocha}".source = "${catppuccin-fish}/themes/${filenameMocha}";
}
