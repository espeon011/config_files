{ pkgs, ... }: {
  home.packages = [
    pkgs.jaq

    # jq を必要とするパッケージ用
    # 今の所不要
    # (pkgs.writeShellScriptBin "jq" ''${pkgs.jaq}/bin/jaq "$@"'')
  ];
}
