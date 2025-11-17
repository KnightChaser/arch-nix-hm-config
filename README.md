
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


This repo was originally written for:

- user: `sayo`
- home: `/home/sayo`

On Fedora, for example (if your Fedora username is `forshaw`):

- user: `forshaw`
- home: `/home/forshaw`

Update both `flake.nix` and `home.nix` to match:

```diff
diff --git a/flake.nix b/flake.nix
index 2327ed9..1a816b6 100644
--- a/flake.nix
+++ b/flake.nix
@@ -1,5 +1,5 @@
 {
-  description = "Home Manager configuration of sayo";
+  description = "Home Manager configuration of forshaw";

@@ -17,7 +17,7 @@
       pkgs = nixpkgs.legacyPackages.${system};
     in
     {
-      homeConfigurations."sayo" = home-manager.lib.homeManagerConfiguration {
+      homeConfigurations."forshaw" = home-manager.lib.homeManagerConfiguration {
         inherit pkgs;
diff --git a/home.nix b/home.nix
index 594365a..baad67c 100644
--- a/home.nix
+++ b/home.nix
@@ -1,8 +1,8 @@
 # home.nix

 {
-  home.username = "sayo";
-  home.homeDirectory = "/home/sayo";
+  home.username = "forshaw";
+  home.homeDirectory = "/home/forshaw";
   home.stateVersion = "25.05";
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
-   Existing shell files such as:
    -   `~/.bashrc`
    -   `~/.bash_profile`
-   will be renamed to:
    -   `~/.bashrc.hm-bak`
    -   `~/.bash_profile.hm-bak`

and replaced by Nix-managed versions.

If you were using **zsh** as your login shell (e.g. on Fedoar with `chsh -s $(which zsh)`), this config   would still generate bash files, but they wouldn’t affect your day-to-day shell. On Fedora, since your login shell is bash by default, you immediately feel the change. After the first successful switch, you can just run:
```bash
home-manager switch --flake .#forshaw
```
