# home.nix

{ config
, pkgs
, lib
, userConfig ? import ./user.nix
, ...
}:

{
  home = {
    username = userConfig.username;
    homeDirectory = userConfig.homeDirectory;
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;

  imports = [
    ./modules/shell.nix
    ./modules/editor.nix
    ./modules/devtools.nix
    ./modules/prompt.nix
  ];
}

