# TODO put pty name in window title on shell start

#source /etc/profile.d/autojump.bash

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion


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
unset HISTFILESIZE

# affects only the display format of history builtin, but being set does cause
# timestamps to be placed in .bash_history
HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '

RED='\[\e[31;1m\]'
GREEN='\[\e[32m\]'
BLUE='\[\e[34m\]'
RESET='\[\e[0m\]'
PS1="${RESET}\n\$?\n${GREEN}\t ${BLUE}\u${RESET}@${GREEN}\h ${BLUE}\w${RESET}\n\\\$ "

# set colors that ls uses for printing file names
eval `dircolors --bourne-shell ~/.dir_colors`

shopt -s histverify
shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

# export PAGER=~/bin/vimpager
# alias less=$PAGER
# alias zless=$PAGER

source ~/.env.sh
unalias -a # clear all aliases first
source ~/.aliases.sh
alias rc='. ~/.bashrc'
alias vrc='vim ~/.bashrc'

#fortune | cowsay -W 78
