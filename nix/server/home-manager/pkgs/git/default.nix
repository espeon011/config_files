{...}: {
  imports = [./user.nix];

  programs.git = {
    enable = true;
    # delta.enable = true;
    # difftastic.enable = true;
    settings = {
      core = {
        editor = "hx";
        quotepath = false;
        # sshcommand = "ssh -i ~/.ssh/id_rsa_git"
      };
      init.defaultBranch = "main";
    };
  };

  programs.delta = {
    enable = true;
  };
}
