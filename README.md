# kmonad (Keybinds)
Download [Nix](https://github.com/BosEriko/nix) as your package manager then install [kmonad](https://search.nixos.org/packages?channel=25.11&query=kmonad&show=kmonad).

## Install kmonad
```sh
environment.systemPackages = [
  pkgs.kmonad
];
```

## Install the config
Make sure to remove or move your current `Kmonad` directory
```sh
git clone https://github.com/BosEriko/kmonad.git ~/.config/kmonad
```
