export EDITOR=nvim
export BROWSER="firefox"

# git alias
alias prc="hsp gh pr create"
alias gpull="hsp git pull"
alias gpush="hsp git push"
alias gcb="git checkout -b"

# neovim
alias vim="nvim"
ln -sf ~/.vim ~/.config/nvim
ln -sf ~/.vimrc ~/.vim/init.vim

# proxy
alias hp="http_proxy=http://localhost:8889"
alias hsp="https_proxy=http://localhost:8889"
# alias hp="http_proxy=http://localhost:7890"
# alias hsp="https_proxy=http://localhost:7890"

# Tiddly Wiki with Bob plugin
# alias wiki="cd ~/wiki/ && vim"

# Unset proxy
alias unsetProxy="unset HTTP_PROXY && unset HTTPS_PROXY && unset http_proxy && unset https_proxy"

# switch keyboard
alias kb0="setxkbmap -option && xcape -e 'Control_L=Escape' && nocaps" 
alias kb1="setxkbmap -option ctrl:nocaps,altwin:swap_lalt_lwin && xcape -e 'Control_L=Escape'"
alias nocaps="setxkbmap -option ctrl:nocaps"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Automatically switch node version when switch directory
find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

# Set the --set-upstream automatically when pushing a new branch
git config --global push.default current

. ~/dotfiles/bin/z.sh
alias dotfiles='/usr/bin/git --git-dir=/home/liang/.dotfiles/ --work-tree=/home/liang'
