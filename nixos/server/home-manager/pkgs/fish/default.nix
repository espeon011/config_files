{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellInit = "set -x SHELL $(which fish)";
    interactiveShellInit = "
      yes | fish_config theme choose catppuccin-mocha
      fish_vi_key_bindings
    ";

    plugins = [
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
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
        exec fish $LOGIN_OPTION
      fi
    '';
  };
}
