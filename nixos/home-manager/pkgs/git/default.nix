{...}: {
  programs.git = {
    enable = true;
    userName = "<your username>";
    userEmail = "<your email>";
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
