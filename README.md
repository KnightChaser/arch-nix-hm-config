
# arch-nix-hm-config

![Nix](https://img.shields.io/badge/NIX-5277C3.svg?style=for-the-badge&logo=NixOS&logoColor=white)
![Arch](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff&style=for-the-badge)
![Fedora](https://img.shields.io/badge/Fedora-294172?style=for-the-badge&logo=fedora&logoColor=white)

## Setup (from Arch Linux to **Fedora**)

### 1. Install Nix and Home Manager

1. Install [Nix](https://nixos.org/download/) and [Home Manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone).

2. On **Fedora**, the official `nixos.org` installer often conflicts with the default SELinux setup. Instead, use the [`petersen/nix`](https://copr.fedorainfracloud.org/coprs/petersen/nix/) COPR to install Nix
   *without* touching SELinux, then follow the Home Manager standalone install guide as usual.

### 2. Adjust username and home for the current machine

Go to `user.nix` and change `username` and `homeDirectory` to your real username and its home directory, so Home Manager can read them and apply the settings. Thus, you don't have to manually modify `home.nix` or `flake.nix` files to continue using Home Manager with an updated username. Be careful not to commit this change to any public repository!

```nix
# user.nix

{
  username = "forshaw";
  homeDirectory = "/home/forshaw";
}
```

### 3. First activation (with backup)

This config is intended for **bash** as follows:

```nix
programs.bash.enable = true;
```

So on Fedora (where the default login shell is also bash), Home Manager will want to take over  files like `~/.bashrc` and `~/.bash_profile`. To avoid destroying your existing shell config, **always use a backup on the first run**:

```bash
home-manager switch -b hm-bak --flake .#forshaw
```

- Existing shell files such as:
  - `~/.bashrc`
  - `~/.bash_profile`
- will be renamed to:
  - `~/.bashrc.hm-bak`
  - `~/.bash_profile.hm-bak`

and replaced by Nix-managed versions.

If you were using **zsh** as your login shell (e.g. on Fedoar with `chsh -s $(which zsh)`), this config   would still generate bash files, but they wouldn’t affect your day-to-day shell. On Fedora, since your login shell is bash by default, you immediately feel the change. After the first successful switch, you can just run:

```bash
home-manager switch --flake .#forshaw
```
