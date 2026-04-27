# dotfiles

## Required packages

```sh
brew install git dotter
```

## Optional packages

```sh
brew install fish starship fzf ripgrep neovim lazygit
```

## Setup commands

```sh
git clone https://github.com/choco-kei/dotfiles.git ~/dotfiles
cd ~/dotfiles
git submodule update --init --recursive
cp .dotter/mac.toml .dotter/local.toml
dotter deploy
```

## Re-apply commands

```sh
cd ~/dotfiles
dotter deploy
```
