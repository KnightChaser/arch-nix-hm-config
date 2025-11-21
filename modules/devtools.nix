# modules/devtools.nix

{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    curl
    wget
    htop
    ripgrep
    fd
    fastfetch
    less
    tree
    unzip

    vscode

    ############################## 
    # Programming tools            
    ############################## 

    # C/C++
    gcc
    gdb
    cmake
    pkg-config
    clang-tools

    # Python
    python3
    python3Packages.virtualenv

    # Go
    go
    gopls
    delve

    # Rust
    rustup

    # JavaScript
    nodejs_22
    pnpm
  ];

  programs.git = {
    enable = true;

    settings = {
      user.name = "knightchaser";
      user.email = "agerio100@naver.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = "false";
    };
  };
}
