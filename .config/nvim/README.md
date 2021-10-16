# Neovim config

Requires neovim-nightly. Use `~/scripts/get_nvim.sh` to install latest appimage
(requires `wget`, `fuse` and `~/.local/bin` int `PATH`).

## Dependencies

### Debian

```bash
sudo apt install nodejs npm cargo gcc g++ wget curl unzip git codespell \
    python3 python3-pip python3-venv \
    python3-flake8 python3-isort python3-autopep8
sudo npm install -g prettier markdownlint markdownlint-cli yarn neovim
cargo install stylua
```

### Arch

```bash
sudo pacman -S nodejs yarn prettier rust base-devel git wget curl unzip \
    codespell python python-pip python-venv python-isort flake8 autopep8
sudo npm install -g markdownlint markdownlint-cli neovim
cargo install stylua
```

## First launch

Make sure `~/.cargo/bin` is in `PATH`.

Install plugins and Language Servers.

```vim
:PackerSync
:PackerCompile
:LspInstall pyright sumneko_lua yamlls jsonls dockerls clangd bashls
```
