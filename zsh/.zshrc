# obs.: analisar $PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/go/bin:$HOME/go/bin:$PATH

# Caminho pra instalação do Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

#  Diretório temporário
export TMPDIR=/tmp

# Variáveis de update
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13

# Configurações de fzf
# Load fzf if installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Load local configurations (not versioned)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

HIST_STAMPS="dd.mm.yyyy"

plugins=(
 docker
 git
 git-prompt
 kubectl
 wd
 zsh-autosuggestions
 zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ALIAS AND FUNCTIONS

alias zource="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"

## GIT
### latest tag 
alias gtl='git describe --abbrev=0 --tags'

### checkout branch with list
alias gcol='git checkout $(git branch --sort=-committerdate | fzf)'

### fetches latest version of branch and resets current branch
gsync () {
    branch=$1
    if [ -z $branch ]; then
        branch=$(git_current_branch)
    fi

    git fetch upstream $branch
    git reset --hard upstream/$branch
}

### fetches latest version of branch and updates current branch
grebase () {
    branch=$1
    if [ -z $branch ]; then
        branch=$(git_current_branch)
    fi

    git fetch upstream $branch
    git rebase upstream/$branch
}

# STARSHIP
SPACESHIP_PROMPT_ASYNC=false
#export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init zsh)"