<div align="center">
  <h1 align="center">.dotfiles</h1>
  <p align="center">
    The best .dotfiles of all time
  </p>
</div>

## Setup

1. Clone the `.dotfiles` repo and all of it's submodules into your home directory and move into it.

```bash
git clone --recurse-submodules https://github.com/gkits/.dotfiles
cd .dotfiles
```

2. Install all packages provided in `packages.txt`.

```bash
xargs sudo zypper in < packages.txt
```

I use [openSUSE Tumbleweed](https://get.opensuse.org/tumbleweed/) therefore the example given uses `zypper in`.
You can replace `zypper in` with the install command for the package manager of your choice (eg. `apt install`, `pacman -i`)

3. Use the `link` script to create all the symlinks

```bash
./link
```
