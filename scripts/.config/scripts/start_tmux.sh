#!/bin/bash

# Konfiguration
SESSION_NAME="zettelkasten"
START_DIRECTORY="/Users/michael_zant/Google Drive/Meine Ablage/zettelkasten"

# Starte tmux und öffne Neovim in der ersten Sitzung
tmux new-session -d -s $SESSION_NAME -c "/Users/michael_zant/Google Drive/Meine Ablage/zettelkasten" 
tmux send-keys -t $SESSION_NAME 'nvim' Enter

# Starte eine zweite Sitzung im aktuellen Verzeichnis
CURRENT_DIRECTORY=$(pwd)
tmux new-session -d -s zweite_session -c "$CURRENT_DIRECTORY"

# Optional: Fügen Sie hier weitere Fenster oder Panes hinzu, wenn Sie möchten
# tmux new-window -t $SESSION_NAME:1
# tmux split-window -v

# Verbinde dich mit der ersten Sitzung
tmux attach -t $SESSION_NAME

