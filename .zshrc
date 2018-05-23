# Path to your oh-my-zsh installation.
export ZSH=/home/winnt/TIBRA/james.anastasiou/.oh-my-zsh

ZSH_THEME="obnoxious-bira"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git autojump)

autoload -U +X bashcompinit && bashcompinit

source $ZSH/oh-my-zsh.sh
alias vim=nvim


alias config='/usr/bin/git --git-dir=/home/winnt/TIBRA/james.anastasiou/.cfg/ --work-tree=/home/winnt/TIBRA/james.anastasiou'

# Autojump
source /usr/share/autojump/autojump.zsh
alias glog='git log --graph'
