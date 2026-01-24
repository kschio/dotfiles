# dotfiles

personal macos configuration. uses [gnu stow](https://www.gnu.org/software/stow/) to symlink configs.

## install

```bash
# prerequisites
sudo softwareupdate -i -a
xcode-select --install

# clone and install
git clone https://github.com/kschio/dotfiles ~/.dotfiles
cd ~/.dotfiles
make
```

## structure

```
config/   → ~/.config/   (fish, nvim, zed, hammerspoon, etc.)
runcom/   → ~/           (.alias)
install/  → package lists (brew, cask, bun, pnpm)
bin/      → utility scripts
```
