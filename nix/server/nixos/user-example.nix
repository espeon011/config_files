# Define a user account. Don't forget to set a password with ‘passwd’.

{ pkgs, ... }: {
  users.users = {
    exampleuser = {
      isNormalUser = true;
      description = "exampleuser";
      extraGroups = [ "networkmanager" "wheel" "video" "render" "vglusers" ];
      # packages = with pkgs; [];

      # デフォルトシェルは bash のままにして interactive shell を fish にするべきかもしれない
      # see: https://nixos.wiki/wiki/Fish#Setting%20fish%20as%20your%20shell
      shell = pkgs.fish;
    };

  };

  programs = {
    fish = { enable = true; };
  };
}
