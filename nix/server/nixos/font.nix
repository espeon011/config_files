{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      nerdfonts
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif CJK JP" "Noto Color Emoji" ];
        sansSerif = [ "Noto Sans CJK JP" "Noto Color Emoji" ];
        monospace = [ "JetBrainsMono NerdFont" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
