# modules/prompt.nix

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[➜](bold red) ";
      };
      # you can add more customizations
      format = "$all$directory$git_branch$git_state$character";
    };
  };
}

