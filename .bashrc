# workaround to make it explicit that gnome terminal supports 256 colors
if [ "$COLORTERM" = 'gnome-terminal' -a "$TERM" = 'xterm' ] ; then
    export TERM='gnome-256color'
fi

# Append to the history file on every prompt.  Interestingly, this allows
# repeats in the file even though erasedups is set.
export PROMPT_COMMAND='history -a; printf "\a"'
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTSIZE=10000

# unset this so the file will never be truncated
export HISTFILESIZE=''

# affects only the display format of history builtin, but being set does cause
# timestamps to be placed in .bash_history
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '

RED='\[\e[31;1m\]'
GREEN='\[\e[32;1m\]'
BLUE='\[\e[34;1m\]'
RESET='\[\e[0m\]'
export PS1="${RESET}\n\$? ${RED}\t ${GREEN}\u@\h ${BLUE}\w${RESET}\n\\\$ "

eval `dircolors --bourne-shell ~/.dir_colors`

shopt -s histverify
shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

export PAGER=~/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

alias l='LC_COLLATE="C" ls -l --almost-all --classify --color=auto --group-directories-first'
alias lt='l -t --reverse'
alias lS='l -S --reverse'
alias lx='l -X'
alias j='jobs -l'
