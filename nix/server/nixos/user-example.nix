# Define a user account. Don't forget to set a password with ‘passwd’.
{...}: {
  users.users = {
    exampleuser = {
      isNormalUser = true;
      description = "exampleuser";
      extraGroups = ["networkmanager" "wheel" "video" "render" "vglusers"];
      # packages = with pkgs; [];
    };
  };
}
