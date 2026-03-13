# Keybindings Cheatsheet

## tmux (Prefix = Ctrl-a)

tmux | Prefix + |     | Pane vertikal teilen
tmux | Prefix + -     | Pane horizontal teilen
tmux | Prefix + h/j/k/l | Pane wechseln (links/unten/oben/rechts)
tmux | Prefix + z     | Pane zoomen (fullscreen toggle)
tmux | Prefix + x     | Pane schließen
tmux | Prefix + c     | Neues Window
tmux | Prefix + ,     | Window umbenennen
tmux | Prefix + g/f/d/s | Window 1/2/3/4 auswählen
tmux | Prefix + ^     | Letztes Window
tmux | Prefix + n / p | Nächstes / Vorheriges Window
tmux | Prefix + T     | Session wechseln (sesh + fzf)
tmux | Prefix + v     | Floating nvim popup öffnen
tmux | Prefix + ?     | Cheatsheet anzeigen
tmux | Prefix + Ctrl-s | Session speichern (resurrect)
tmux | Prefix + Ctrl-r | Session wiederherstellen (resurrect)

## Neovim (Leader = Space)

nvim | Space e        | Datei-Explorer (netrw)
nvim | Space w        | Datei speichern
nvim | Space ff       | Dateien suchen (Telescope)
nvim | Space fg       | Text in Dateien suchen (Telescope grep)
nvim | Space fb       | Offene Buffer anzeigen (Telescope)
nvim | Space do       | Diffview öffnen (Git changes)
nvim | Space dc       | Diffview schließen
nvim | Space dh       | Git-History der aktuellen Datei
nvim | co             | Git-Konflikt: Choose Ours
nvim | ct             | Git-Konflikt: Choose Theirs
nvim | cb             | Git-Konflikt: Choose Both
nvim | c0             | Git-Konflikt: Choose None
nvim | ]x / [x        | Git-Konflikt: nächster / vorheriger

## Terminal

term | vf             | Datei mit fzf suchen und in nvim öffnen
term | keys           | Dieses Cheatsheet durchsuchen (fzf)
