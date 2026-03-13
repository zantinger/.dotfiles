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
| ghostty | Ghostty terminal (Catppuccin Frappé) |
| kitty | Kitty terminal (Backup, Catppuccin Frappé) |
| tmux | tmux config (Catppuccin Frappé) |
| scripts | Helper scripts |

## Neovim

Plugin Manager: [lazy.nvim](https://github.com/folke/lazy.nvim)

Plugins:
- Telescope (fuzzy finder)
- Markdown Preview
- Diffview (git diff viewer)
- git-conflict (inline merge conflict resolution)
- Catppuccin, TokyoNight, Gruvbox (themes, default: Catppuccin Frappé)

## tmux

- Plugin Manager: [tpm](https://github.com/tmux-plugins/tpm)
- Theme: [Catppuccin](https://github.com/catppuccin/tmux) (Frappé)
- Session persistence: tmux-resurrect + tmux-continuum
- Session switching: [sesh](https://github.com/joshmedeski/sesh) + fzf
- Statusleiste rechts: [gitmux](https://github.com/arl/gitmux) (Branch, geänderte Dateien)
- `Prefix + |` / `Prefix + -` → Pane vertikal/horizontal teilen
- `Prefix + v` → Floating nvim popup
- `Prefix + T` → Session switcher (sesh)
- `Prefix + ?` → Keybindings Cheatsheet

## Ghostty

- Theme: Catppuccin Frappé (built-in)
- Font: FiraCode Nerd Font (13pt)
- Padding: 10px

## Kitty (Backup)

- Theme: Catppuccin Frappé
- Font: FiraCode Nerd Font (13pt)
- Padding: 10px

## Cheatsheet

Alle Keybindings sind in `cheatsheet.md` dokumentiert.
Zugriff via `keys` (Terminal-Alias) oder `Prefix + ?` (tmux popup).

## Known Issues

### Screen flicker with Claude Code in tmux + Kitty

Claude Code erzeugt 4.000-6.700 Scroll-Events/Sekunde beim Streaming von Output ([Issue #9935](https://github.com/anthropics/claude-code/issues/9935)). Das verursacht ein kurzes Hoch-/Runter-Scrollen des Bildschirms in tmux. Das Problem tritt nur in tmux auf, nicht in Kitty direkt.

Getestete Fixes (ohne Erfolg):
- `allow-passthrough on`, `terminal-features Sync`, `extended-keys on`
- `placement_strategy top-left`, `resize_in_steps yes`, `sync_to_monitor no` (Kitty)
- Deaktivieren aller tmux-Plugins
- Minimale tmux-Config

**Lösung:** Ghostty – Das Problem tritt mit Ghostty nicht auf.

Alternativer Workaround: [claude-chill](https://github.com/davidbeesley/claude-chill) – ein PTY-Proxy der Claude Code Output puffert und nur differentielle Updates sendet.

```bash
cargo install --git https://github.com/davidbeesley/claude-chill
claude-chill claude
```

## Prerequisites

- [Nerd Fonts](https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e): `brew install --cask font-fira-code-nerd-font`
- [fzf](https://github.com/junegunn/fzf): `brew install fzf`
- [sesh](https://github.com/joshmedeski/sesh): `brew install sesh`
- [zoxide](https://github.com/ajeetdsouza/zoxide): `brew install zoxide`
- [gitmux](https://github.com/arl/gitmux): `brew install gitmux`
