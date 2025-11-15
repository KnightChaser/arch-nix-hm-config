{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sayo";
  home.homeDirectory = "/home/sayo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    git
    curl
    wget
    gcc
    htop
    ripgrep
    fd
    neofetch
    less
    tree
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll      = "ls -al .";
      c       = "clear";

      # For python3 development environment
      govenv  = "source ./.venv/bin/activate";
      byevenv = "deactivate";
    };
  };

  programs.git = {
    enable = true;

    extraConfig = {
      user.name = "knightchaser";
      user.email = "agerio100@naver.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = "false";
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };



  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = { 
    ".config/nvim".source = ./dotfiles/nvim;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
