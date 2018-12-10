# Setup fzf
# ---------
if [[ ! "$PATH" == */home/winnt/TIBRA/james.anastasiou/.fzf/bin* ]]; then
  export PATH="$PATH:/home/winnt/TIBRA/james.anastasiou/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/winnt/TIBRA/james.anastasiou/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/winnt/TIBRA/james.anastasiou/.fzf/shell/key-bindings.bash"

