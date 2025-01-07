{...}: {
  programs.starship = {
    enable = true;

    settings = {
      status = {
        disabled = false;
        pipestatus = true;
        pipestatus_format = "\[$pipestatus\] => [$symbol$common_meaning$signal_name$maybe_int]($style) "; # デフォルトの最後に空白を入れただけ
        symbol = "×";
      };

      character = {
        format = "$symbol \\$ ";
        success_symbol = "[ INS ](fg:black bg:green)";
        error_symbol = "[ INS ](fg:black bg:green)";
        vimcmd_symbol = "[ NOR ](fg:black bg:blue)";
        vimcmd_replace_one_symbol = "[ REP ](fg:black bg:red)";
        vimcmd_replace_symbol = "[ REP ](fg:black bg:red)";
        vimcmd_visual_symbol = "[ SEL ](fg:black bg:purple)";
      };
    };
  };
}