# this file intended to be readable by both bash and zsh

alias j='jobs -l' # show PIDs
alias -- -='cd -' # -- required so that alias doesn't read "-=" as an option
#alias r='printf "\ec"' # reset terminal, doesn't appear to work very well

# replacement aliases
alias cp='cp --interactive --reflink=auto'
alias mv='mv --interactive'
alias rm='rm --interactive=once'
alias abook='abook --config ~/.config/abook/abookrc --datafile ~/.config/abook/addressbook'

alias ct='SHLVL=$((SHLVL - 1)) urxvt BG'
alias d='dirs -v'
alias dm='dmesg --color=always --time-format iso'
alias dmf='dm --follow'
alias dmt='dm | tail'
alias dpoff='xrandr --output DP2 --off'
alias dpon='xrandr --output DP2 --mode 1280x1024 --right-of eDP1'
alias e='exit'
alias f='find'
alias fd='find -type d | sort' # TODO reduce redundancy with '| sort'
alias fe='find -empty | sort'
alias fed='find -type d -empty | sort'
alias fef='find -type f -empty | sort'
alias ff='find -type f | sort'
alias fne='find -not -empty | sort'
alias fned='find -type d -not -empty | sort'
alias fnef='find -type f -not -empty | sort'
alias g='gpg2'
alias ga='git add'
alias gl='git log --graph --pretty=oneline'
alias gc='git commit --verbose'
alias gd='git diff'
alias gdc='git diff --cached'
alias pg='ping -c 1 google.com'
alias pw='ping -c 1 wpi.edu'
alias gs='git status -s'
alias hd='hexdump -C'
alias ipy='ipython'
alias jcf='journalctl --follow --all --output=short-iso'
alias l='ls -l --almost-all --classify --color=always --group-directories-first --time-style=long-iso'
alias lS='l -S --reverse' # sort by size
alias lb='lsblk --output NAME,TYPE,ROTA,SIZE,FSTYPE,LABEL,MOUNTPOINT,UUID'
alias lt='l -t --reverse' # sort by time
alias lx='l -X' # sort by extension
alias m='make -j5'
alias ma='TZ="" mutt' # blank TZ interpreted as UTC, TODO find a correct value for TZ that is UTC
alias news="VISUAL=\"vim -c 'set notitle'\" newsbeuter"
alias pa='ps -eF | ack'
alias pacredb='pc -Syy'
alias pacup='pc -Syu'
alias pc='pacaur'
alias pcq='pc -Q'
alias pcql='pc -Ql'
alias pcqo='pc -Qo'
alias pcqs='pc -Qs'
alias pcs='pc -S'
alias pcsi='pc -Si'
alias pcss='pc -Ss'
alias pf='pkgfile'
alias s='sudo --preserve-env --shell' # start up a root shell while preserving the environment for comfort
alias sd='sudo ' # end with space so that other aliases will expand after it
alias tbreak='sleep 5m && notify-send -u critical "Timer is up" "Go back to work" &'
alias twork='sleep 25m && notify-send -u critical "Timer is up" "Take a 5m break" &'
alias unopdf='unoconv -f pdf'
alias v='vim'
alias vc='vim -N -u NONE' # clean vim, with minimal configuration (just set nocompatible)
alias vs='vim -n -i NONE' # secure vim, with no viminfo or swap file
alias ythd='youtube-dl -f137+140' # get 1080p video and audio
