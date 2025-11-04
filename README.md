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
xargs paru -Syu < packages.txt
```

I use [CachyOS](https://cachyos.org/) which is Arch based therefore the example given uses `paru`.
You can replace `paru -Syu` with the install command for the package manager of your choice (eg. `apt install`)

3. Use the `link` script to create all the symlinks

```bash
./link
```
