if [ "$COLORTERM" = 'gnome-terminal' -a "$TERM" = 'xterm' ] ; then
    export TERM='gnome-256color'
fi
# Append to the history file on every prompt.  Interestingly, this allows
# repeats in the file even though erasedups is set.
export PROMPT_COMMAND='history -a'
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTSIZE=10000
# unset this so the file will never be truncated
export HISTFILESIZE=''
# affects only the display format of history builtin, but being set does cause
# timestamps to be placed in .bash_history
export HISTTIMEFORMAT='%m-%d-%y %H:%M:%S '

export PS1='\n$? \[\e[31;1m\]\t \u@\h \w\[\e[0m\]\n\$ '

shopt -s histverify
shopt -s histappend
shopt -s autocd
shopt -s checkwinsize
