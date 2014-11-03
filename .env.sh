# common environment variables for zsh and bash

# workaround to make it explicit that gnome terminal supports 256 colors
if [ "$COLORTERM" = 'gnome-terminal' -a "$TERM" = 'xterm' ] ; then
    export TERM='gnome-256color'
fi

export VISUAL=vim
export EDITOR=vim

# LC_COLLATE set so that names are sorted asciibetically, not with the default
# ignoring of period at the beginning of the name
export LC_COLLATE=C

# support colors in less
# NOTE that for these to work, groff needs to be set to not use SGR when
# rendering man pages.  Do this by adding a line with 'output x X tty: sgr 0'
# to your machine's site-tmac/man.local file in its groff configuration area.
# This is /etc/groff/ on Fedora and /usr/share/groff/ on Arch.
# This appears to work out of the box on some distributions (Arch, that I know of),
# but not on Fedora.  I got this to work by copying Arch's man.local file wholesale.
# Alternatively, set the environment variable GROFF_NO_SGR to something.
export GROFF_NO_SGR='yes'
export LESS_TERMCAP_mb=$'\E[1;31m'          # blink     - bold red
export LESS_TERMCAP_md=$'\E[32m'            # bold      - green
export LESS_TERMCAP_so=$'\E[1;38;5;13;40m'  # standout  - bold violet on base02
export LESS_TERMCAP_us=$'\E[33m'            # underline - yellow
export LESS_TERMCAP_me=$'\E[0m'             # end bold/blink
export LESS_TERMCAP_se=$'\E[0m'             # end standout
export LESS_TERMCAP_ue=$'\E[0m'             # end underline

#export LESS_TERMCAP_DEBUG='yes' # get less to show which termcap sequences it uses

export MANWIDTH='80' # format manpages to always be 80 columns
#export MANPAGER='bash -c "vim -MRn -i NONE -c \"set ft=man nomod nolist nospell nonu\" </dev/tty <(col -b)"'
