# shell.nix

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -al";
      c = "clear";
      govenv = "source ./.venv/bin/activate";
      byevenv = "deactivate";
    };
    initExtra = ''
      if [ -t 1 ] && command -v fastfetch >/dev/null 2>&1; then
        fastfetch
      fi
    '';
  };

  home.sessionVariables = { EDITOR = "nvim"; };
}

