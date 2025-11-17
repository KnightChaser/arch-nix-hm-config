# arch-nix-hm-config

## Setup (From Arch Linux to **Fedora OS**)

1. Install [Nix](https://nixos.org/download/) and [Nix home-manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone) on your Linux desktop computer.
2. Modify the username field(currently set to `sayo`) inside `flake.nix`, `home.nix`, to your current username. For example,
```diff
❯ git diff
diff --git a/flake.nix b/flake.nix
index 2327ed9..1a816b6 100644
--- a/flake.nix
+++ b/flake.nix
@@ -1,5 +1,5 @@
 {
-  description = "Home Manager configuration of sayo";
+  description = "Home Manager configuration of forshaw";
 
   inputs = {
     # Specify the source of Home Manager and Nixpkgs.
@@ -17,7 +17,7 @@
       pkgs = nixpkgs.legacyPackages.${system};
     in
     {
-      homeConfigurations."sayo" = home-manager.lib.homeManagerConfiguration {
+      homeConfigurations."forshaw" = home-manager.lib.homeManagerConfiguration {
         inherit pkgs;
 
         # Specify your home configuration modules here, for example,
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
 
   programs.home-manager.enable = true;

```
3. Run `home-manager switch` like below.
   I set `home.shellAliases.home-manager = "home-manager -b hm.bak";` alias in `moduels/shell.nix` so you can type
   as follows to refresh the environment
```
home-manager --flake .#(Your new Linux username)
```
