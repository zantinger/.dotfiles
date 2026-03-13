# .dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```bash
./install
```

## Modules

| Module | Description |
|---|---|
| nvim | Neovim config (lazy.nvim) |
| kitty | Kitty terminal |
| tmux | tmux config |
| fish | Fish shell |
| scripts | Helper scripts |

## Neovim

Plugin Manager: [lazy.nvim](https://github.com/folke/lazy.nvim)

Plugins:
- Telescope (fuzzy finder)
- Markdown Preview
- Catppuccin, TokyoNight, Gruvbox (themes, default: Catppuccin Frappé)

## tmux

- Plugin Manager: [tpm](https://github.com/tmux-plugins/tpm)
- Theme: [tmux-gruvbox](https://github.com/egel/tmux-gruvbox)
- `Prefix + v` → Floating nvim popup

## Prerequisites

- [Nerd Fonts](https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e): `brew install --cask font-fira-code-nerd-font`
