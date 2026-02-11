## kmonad (Keybinds)
1. Make sure kmonad is on your [Home Manager (Nix)](https://github.com/BosEriko/nix/blob/master/home.nix) then run `home-manager switch`.
2. Create kmonad Config on [~/.config/kmonad/keymap.kbd](.config/kmonad/keymap.kbd).
3. Make sure the the path `defcfg input` on `.config/kmonad/keymap.kbd` is the correct keyboard. Use `ls /dev/input/by-id/` to check the proper ID.
4. Make sure kmonad is being started properly inside [Sway config](https://github.com/BosEriko/sway/blob/main/.config/sway/config).
