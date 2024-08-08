# .DOTFILES

My configurations for [Sway](https://swaywm.org), [NeoVim](https://neovim.io), 
[Tmux](https://github.com/tmux/tmux) and [ZSH](https://www.zsh.org).  
These configs are build with software development in mind but can be used otherwise.

## Requirements

### Installation
All tools required to properly install the configurations the way it was intended.

- [stow](https://www.gnu.org/software/stow/)

### Optional
Everything you need to use this configuration to its full potential.

- [sway](https://github.com/swaywm/sway)
    - [swaylock](https://github.com/swaywm/swaylock)
    - [waybar](https://github.com/Alexays/Waybar)
    - [mako](https://github.com/emersion/mako)
- [neovim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux)
- [zsh](https://www.zsh.org)
- For sshot script
    - [grim](https://github.com/emersion/grim)
    - [slurp](https://github.com/emersion/slurp)

## Installation

1. Clone the `.dotfiles` repo and all of it's submodules into your home directory.
```bash
git clone --recurse-submodules https://github.com/gkits/.dotfiles
```
2. Move into the freshly cloned directory.
```bash
cd .dotfiles
```
3. Use the install script to create all the symlinks
```bash
./install
```
