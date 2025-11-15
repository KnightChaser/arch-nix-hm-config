# home.nix

{
  home.username = "sayo";
  home.homeDirectory = "/home/sayo";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  imports = [
    ./modules/shell.nix
    ./modules/editor.nix
    ./modules/devtools.nix
    ./modules/prompt.nix
  ];
}

