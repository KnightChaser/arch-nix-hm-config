# modules/prompt.nix

{
  programs.starship = { enable = true; };

  home.file = {
    ".config/starship.toml".source = ../dotfiles/starship/starship.toml;
  };
}

