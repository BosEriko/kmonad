# kmonad (Keybinds)
Download [Nix](https://github.com/BosEriko/nix) as your package manager then install [kmonad](https://search.nixos.org/packages?channel=25.11&query=kmonad&show=kmonad).

## Install kmonad
```sh
home.packages = with pkgs; [
  kmonad
];
```

## Clone the Repository
```sh
git clone https://github.com/BosEriko/kmonad.git ~/.config/kmonad
```

## Rofi
Install Rofi for quick navigation and run the following:
```sh
mkdir -p ~/.config/rofi/themes
ln -s ~/.config/kmonad/default.rasi ~/.config/rofi/themes/default.rasi
ln -s ~/.config/kmonad/config.rasi ~/.config/rofi/config.rasi
```
