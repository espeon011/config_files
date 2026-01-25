{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.noto
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        # serif = [ "Noto Serif CJK JP" "Noto Color Emoji" ];
        # sansSerif = [ "Noto Sans CJK JP" "Noto Color Emoji" ];
        serif = [ "Noto Serif CJK JP" "NotoSans NF" "Noto Color Emoji" ];
        sansSerif = [ "Noto Sans CJK JP" "NotoSerif NF" "Noto Color Emoji" ];
        # monospace = [ "JetBrainsMono NerdFont" "Noto Color Emoji" ];
        monospace = [ "Noto Sans Mono CJK JP" "NotoMono NF" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
