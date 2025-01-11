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

  # デフォルトシェルを bash にしたままインタラクティブシェルとして fish を設定する.
  # see: https://nixos.wiki/wiki/Fish#Setting%20fish%20as%20your%20shell
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
