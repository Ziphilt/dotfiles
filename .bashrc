# TODO put pty name in window title on shell start

#source /etc/profile.d/autojump.bash

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion

# workaround to make it explicit that gnome terminal supports 256 colors
if [ "$COLORTERM" = 'gnome-terminal' -a "$TERM" = 'xterm' ] ; then
    export TERM='gnome-256color'
fi

export VISUAL=vim
export EDITOR=vim

# Append to the history file on every prompt.  Interestingly, this allows
# repeats in the file even though erasedups is set.  Also prints the
# bell/alert character, which tells urxvt to set the urgency hint.
#PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a; printf \"\a\""
PROMPT_COMMAND='history -a; printf "\a"'
HISTCONTROL=ignorespace:ignoredups:erasedups
HISTSIZE=10000

unset MAIL
unset MAILCHECK

# unset this so the file will never be truncated
HISTFILESIZE=''

# affects only the display format of history builtin, but being set does cause
# timestamps to be placed in .bash_history
HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '

RED='\[\e[31;1m\]'
GREEN='\[\e[32;1m\]'
BLUE='\[\e[34;1m\]'
RESET='\[\e[0m\]'
PS1="${RESET}\n\$? ${RED}\t ${GREEN}\u@\h ${BLUE}\w${RESET}\n\\\$ "

# set colors that ls uses for printing file names
eval `dircolors --bourne-shell ~/.dir_colors`

shopt -s histverify
shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

# export PAGER=~/bin/vimpager
# alias less=$PAGER
# alias zless=$PAGER

# LC_COLLATE set so that names are sorted asciibetically, not with the default
# ignoring of period at the beginning of the name
alias l='LC_COLLATE="C" ls -l --almost-all --classify --color=auto --group-directories-first'
# sort by time
alias lt='l -t --reverse'
# sort by size
alias lS='l -S --reverse'
# sort by extension
alias lx='l -X'
# show PIDs
#alias j='jobs -l'

alias twork='sleep 25m && notify-send -u critical "Timer is up" "Take a 5m break" &'
alias tbreak='sleep 5m && notify-send -u critical "Timer is up" "Go back to work" &'

# -- required so that alias doesn't read "-=" as an option
alias -- -='cd -'

alias rc='. ~/.bashrc'
alias vrc='vim ~/.bashrc'

# secure vim, with no viminfo or swap file
alias secvim='vim -n -i NONE'
# clean vim, with minimal configuration (just set nocompatible)
alias cleanvim='vim -N -u NONE'

alias e='exit'
alias m='make -j5'
# start up a root shell while preserving the environment for comfort
alias s='sudo --preserve-env --shell'
alias gs='git status -s'
alias gp='ping -c 1 google.com'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit -m'
alias pa='ps -eF | ack'
# reset terminal
alias r='printf "\ec"'

#fortune | cowsay -W 78
