{ pkgs, ... }:
let
  theme = if builtins.pathExists ./catppuccin.nix then "Catppuccin Mocha" else "fish default";
in
{
  imports = [ ./catppuccin.nix ];

  programs.fish = {
    enable = true;
    shellInit = "set -x SHELL $(which fish)";
    interactiveShellInit = "
      yes | fish_config theme save '${theme}'
      fish_vi_key_bindings
    ";

    plugins = [
      { name = "plugin-git"; src = pkgs.fishPlugins.plugin-git.src; }

      ## 最終的には starship をやめて hydro に置き換えたい
      ## そのために starship でどのような機能があったかを確認しておこう
      ## - 中断されたタスクがある場合に出るマーク: ✦
      ## - プログラミング言語のバージョン(これは別にいらないかな...)
      ## - nix env ($IN_NIX_SHELL で判定できる)
      # { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }

      # { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    ];
  };
}
