{ ... }: {
  programs.git = {
    enable = true;
    # difftastic.enable = true;
    settings = {
      user = (import ./user.nix);
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
    enableGitIntegration = true;
  };
}
