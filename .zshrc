# Path to your oh-my-zsh installation.
export ZSH=/home/winnt/TIBRA/james.anastasiou/.oh-my-zsh

ZSH_THEME="jimbo"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git autojump)

autoload -U +X bashcompinit && bashcompinit

source $ZSH/oh-my-zsh.sh
alias vim=nvim
alias vum=nvim
alias vun=nvim

alias please='sudo $(fc -ln -1)'
alias config='/usr/bin/git --git-dir=/home/winnt/TIBRA/james.anastasiou/.cfg/ --work-tree=/home/winnt/TIBRA/james.anastasiou'
alias tmux='tmux -2'

# Autojump
source /usr/share/autojump/autojump.zsh

# Auto Push Directories
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'

# Remap Escape
setxkbmap -option caps:escape

# Programming Aliases
alias vimdiff='nvim -d'
alias ninja='nice ninja'

# Prompt Timeout?
if [ -z "$TMUX" ]; then
  TMOUT=60
fi

TRAPALRM() {
    zle reset-prompt
#    if ! [[ "$WIDGET" =~ ^(complete-word|fzf-completion)$ ]]; then
#        zle reset-prompt
#    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
