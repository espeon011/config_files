{ ... }: {
  programs.eww = {
    enable = true;
    configDir = ./config;
    # configDir = ./config2;
    # ↑ このオプションがあるおかげで xdg.configFile の処理が邪魔され, ファイルを配置できなくなる
    #   このオプションを実装した人は本当に頭がおかしい
  };

  # xdg.configFile."eww/eww.scss".source = ./eww.scss;
  # xdg.configFile."eww/eww.yuck".source = ./eww.yuck;
}
