# TODO investigate weird history rewriting glitches
# TODO enable completion by words in recent history
# TODO investigate ^R issues with root on Fedora
# TODO more convenient file rename

autoload -Uz compinit
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz edit-command-line
autoload -U tetris
autoload zmv
#autoload -U colors

tetris >/dev/null 2>/dev/null

# TODO what does 'zle -N' do?
#zle -N zle-line-init
#zle -N zle-keymap-select
zle -N tetris
zle -N edit-command-line

#colors
compinit

setopt correct

setopt noclobber
setopt dvorak

# changing directories

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

setopt interactive_comments

setopt prompt_subst

# completion

setopt complete_in_word
setopt list_packed

setopt extended_glob # more magic

setopt long_list_jobs # show PID when suspending and resuming jobs

# history

setopt append_history
setopt extended_history
setopt hist_allow_clobber
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
#setopt hist_ignore_space
#setopt hist_no_store
setopt hist_reduce_blanks
#setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
#setopt share_history

unset MAILCHECK
unset MAIL

SAVEHIST=40000
HISTSIZE=40000
HISTFILE=~/.zsh/history

REPORTTIME=4 # print cpu usage for programs taking more than 4 seconds combined sys+user time

KEYTIMEOUT=1 # reduce delay on Escape key, mostly for vi mode

typeset -U path # make elements of this array unique
path=(~/bin ~/.cabal/bin ~/.gem/ruby/2.1.0/bin $path)

export -TU PYTHONPATH pythonpath # make elements of this array unique
pythonpath=(/usr/local/lib/python3.4/site-packages)

#cdpath=(~) # make it convenient to get to home directory from anywhere

# emacs mode, because vi mode is awkward and incomplete
# TODO make vi mode not awkward
bindkey -e
bindkey -M vicmd '?' history-incremental-search-forward
bindkey -M vicmd '/' history-incremental-search-backward
# TODO choose a nice key for this
#bindkey -M menuselect '^o' accept-and-infer-next-history
bindkey '^I' complete-word # completion already configured to do expansion
bindkey "^?" backward-delete-char
bindkey '^X^E' edit-command-line

bindkey '^T' tetris
bindkey -M tetris Th tetris-left
bindkey -M tetris Tt tetris-rotate
bindkey -M tetris Tn tetris-right

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

eval `dircolors --bourne-shell ~/.dir_colors`

#PS1="
#%(?..$fg[red]%B%?%b$fg[default]
#)%(1j.$fg[yellow]%B%jJ%b$fg[default] .)%l %* $fg[blue]%n$fg[default]@$fg[green]%m$fg[default] %~
#%(4L.$fg[yellow]%B+%L%b$fg[default]
#.)%# "

# linux tty does not support setting a window title
if [ "$TERM" = 'linux' ] ; then
    pr_title=''
else
    pr_title=$'\e]0;zsh %n@%m %l %/\a'
    add-zsh-hook precmd send_beep
    add-zsh-hook preexec grml_control_xterm_title
fi

#pr_bell=$'\a'
pr_rc='%(?..%F{1}%B%?%b%f
)'
pr_jobs='%(1j.%F{3}%B%jJ%b%f .)'
pr_time='%F{2}%*%f'
pr_username='%(!.%F{1}%B.%F{4})%n%b%f' # TODO make color based on hash of name
pr_at='%F{11}@%f'
pr_hostname='%F{2}%m%f' # TODO make color based on hash of name
pr_level='%(5L.%F{3}%B+%L%b%f
.)'
pr_promptchar='%(!.%F{1}%B#%b%f.%F{11}%%%f)'

# TODO make this work in console
#vi_mode='cmd'
function zle-line-init zle-keymap-select {
    #vi_mode="${${KEYMAP/vicmd/%F{3\}%BC%b%f}/(main|viins)/i}"
    case $KEYMAP in
        vicmd)
            printf "\e]12;3\a" ;;

        main|viins)
            printf "\e]12;12\a" ;;
    esac

    #zle reset-prompt
}
PS1="${pr_title}
${pr_rc}${pr_jobs}${pr_time} ${pr_username}${pr_at}${pr_hostname} \${vcs_info_msg_0_}
${pr_level}${pr_promptchar} "

source ~/.env.sh
unalias -m '*' # clear all aliases first
source ~/.aliases.sh
alias rc='. ~/.zshrc'
alias vrc='vim ~/.zshrc'
alias -g BG='&>/dev/null &|'
alias -g NOERR='2>/dev/null'

# mkdir -p and then cd
# borrowed from grml
mkcd() {
    if (( ARGC != 1 )); then
        printf 'usage: mkcd <new-directory>\n'
        return 1;
    fi
    if [[ ! -d "$1" ]]; then
        command mkdir -p "$1"
    else
        printf '`%s'\'' already exists: cd-ing.\n' "$1"
    fi
    builtin cd "$1"
}

# wrapper for `info`
infopage() {
    if (( ARGC != 1 )); then
        printf 'usage: infopage <info-page>\n'
        return 1;
    fi
    info "$1" --subnodes -o - | less
}

function info_print () {
    local esc_begin esc_end
    esc_begin="$1"
    esc_end="$2"
    shift 2
    printf '%s' ${esc_begin}
    printf '%s' "$*"
    printf '%s' "${esc_end}"
}

function set_title () {
    info_print  $'\e]0;' $'\a' "$@"
}

function grml_control_xterm_title () {
    case $TERM in
        (xterm*|rxvt*)
            # TODO figure out what this wizardry means
            set_title "${(%):-"zsh %n@%m %l %/:"}" "$1"
            ;;
    esac
}

# this apparently needs to be in a function called by the precmd hook, because
# if it is in PS1, it is getting retriggered
function send_beep () {
    printf '\a'
}

add-zsh-hook precmd vcs_info

zstyle ':completion:*' auto-description 'specify %d'
zstyle ':completion:*:descriptions' format '%F{11}complete%f %F{6}%B%d%b%f'
zstyle ':completion:*' group-name '' # separate completion groups by tag
zstyle ':completion:*' list-colors "ma=38;5;8;48;5;2" ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select # always use menu selection
zstyle ':completion:*' verbose true # list tags to be completed
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
# TODO make this work correctly
#zstyle ':completion:*:expand:*' tag-order all-expansions

# parse_git_dirty() {
#     if command git ls-files --other --directory --exclude-standard 2>/dev/null | sed q1 >/dev/null 2>/dev/null; then
#         echo ''
#     else
#         echo ' %F{3}%B?%%b%f'
#     fi
# }

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '^??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        # TODO put this in its own logical item in hook_com
        hook_com[branch]+=' %F{3}%B?%b%f'
    fi
}

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' nvcsformats "%F{4}%/%f"
# TODO figure out how to do tilde reduction on %R
zstyle ':vcs_info:*' formats "%F{11}%R%f%F{4}/%S%f
%F{11}%s%f %F{4}%b%f%u%c"
zstyle ':vcs_info:*' actionformats "%F{11}%R%f%F{4}/%S%f
%F{11}%s%f %F{4}%b%f%u%c %F{3}%B%a%%b%f"
zstyle ':vcs_info:*' stagedstr " %F{1}%BS%b%f"
zstyle ':vcs_info:*' unstagedstr " %F{9}%BU%b%f"
# TODO get this to be used
# zstyle ':vcs_info:*' untrackedstr " %F{3}%B?%b%f"

# TODO what do these do?
zstyle ':completion:*' completer _expand _complete _approximate _ignored
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
