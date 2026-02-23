# kmonad (Keybinds)
Download [Nix](https://github.com/BosEriko/nix) as your package manager then install [kmonad](https://search.nixos.org/packages?&query=kmonad&show=kmonad).

## Install kmonad and its dependencies
```sh
nix-env -iA nixpkgs.kmonad
nix-env -iA nixpkgs.rofi
```

## Clone the Repository
```sh
git clone https://github.com/BosEriko/kmonad.git ~/.config/kmonad
```

## Symlink rofi Files
```sh
mkdir -p ~/.config/rofi/themes
ln -s ~/.config/kmonad/default.rasi ~/.config/rofi/themes/default.rasi
ln -s ~/.config/kmonad/config.rasi ~/.config/rofi/config.rasi
```
