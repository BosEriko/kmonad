# kmonad (Keybinds)
Download [Nix](https://github.com/BosEriko/nix) as your package manager then install [kmonad](https://search.nixos.org/packages?&query=kmonad&show=kmonad) and [rofi](https://search.nixos.org/packages?&query=rofi&show=rofi).

## Install kmonad and rofi
```sh
nix-env -iA nixos.kmonad
nix-env -iA nixos.rofi
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
