{...}: {
  programs.git = {
    enable = true;
    userName = "psiana011";
    userEmail = "psiana011.endo@gmail.com";
    delta.enable = true;
    # difftastic.enable = true;
    extraConfig = {
      core = {
        editor = "hx";
        quotepath = false;
        # sshcommand = "ssh -i ~/.ssh/id_rsa_git"
      };
      init.defaultBranch = "main";
    };
  };
}