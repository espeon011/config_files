{ pkgs, ... }:
let
  catppuccin-starship = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "starship";
    rev = "e99ba6b210c0739af2a18094024ca0bdf4bb3225";
    hash = "sha256-1w0TJdQP5lb9jCrCmhPlSexf0PkAlcz8GBDEsRjPRns=";
  };
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = false; # bash 起動時は starship を off にする

    settings = {
      palette = "catppuccin_mocha";

      palettes = {
        catppuccin_frappe = (builtins.fromTOML (builtins.readFile "${catppuccin-starship}/themes/frappe.toml")).palettes.catppuccin_frappe;
        catppuccin_latte = (builtins.fromTOML (builtins.readFile "${catppuccin-starship}/themes/latte.toml")).palettes.catppuccin_latte;
        catppuccin_macchiato = (builtins.fromTOML (builtins.readFile "${catppuccin-starship}/themes/macchiato.toml")).palettes.catppuccin_macchiato;
        catppuccin_mocha = (builtins.fromTOML (builtins.readFile "${catppuccin-starship}/themes/mocha.toml")).palettes.catppuccin_mocha;
      };

      status = {
        disabled = false;
        pipestatus = true;
        pipestatus_format = "\\[$pipestatus\\] => [$symbol$common_meaning$signal_name$maybe_int]($style) "; # デフォルトの最後に空白を入れただけ
        pipestatus_segment_format = "[$symbol$status]($style)";
        symbol = "×";
      };

      # 色合いは極力 https://github.com/helix-editor/helix/blob/master/runtime/themes/catppuccin_mocha.toml に合わせる
      character = {
        success_symbol = "[ INS ](fg:base bg:green)";
        error_symbol = "[ INS ](fg:base bg:green)";
        vimcmd_symbol = "[ NOR ](fg:base bg:lavender)";
        vimcmd_replace_one_symbol = "[ REP ](fg:base bg:red)";
        vimcmd_replace_symbol = "[ REP ](fg:base bg:red)";
        vimcmd_visual_symbol = "[ SEL ](fg:base bg:flamingo)";
      };

      format = "$all$character$status\\$ ";
    };
  };
}
