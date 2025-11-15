# modules/editor.nix

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Neovim dotfiles present in <repo_root>/dotfiles/nvim
  home.file = { ".config/nvim".source = ../dotfiles/nvim; };
}

