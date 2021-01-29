#!/bin/bash
cd "$HOME/vimwiki"
file=$(rg --column --line-number --smart-case . | fzf --delimiter=: --preview "fzf-bat-preview {1} {2}" --preview-window=right:70%)
# file=$(rg --files | fzf --preview "bat --color always {1}" --preview-window=right:70%)

# Search file contents
[[ -n "$file" ]] || exit

# Set kitty window spacing
kitty @ set-spacing padding=12

echo $file | xargs -d ':' sh -c 'nvim "+normal $1G" "$0"'

# Inspirations:
# Simple Note-Taking with fzf and Vim: https://medium.com/adorableio/simple-note-taking-with-fzf-and-vim-2a647a39cfa
