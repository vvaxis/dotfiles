# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vvaxis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (cat ~/.cache/wal/sequences &) # DON'T USE THIS FOR KITTY
# Already in ~/.cache/wal/colors-kitty.conf

# To add support for TTYs this line can be optionally added.
# Só carrega colors-tty.sh se estiver em um TTY real
# [ "$TERM" = "linux" ] && source ~/.cache/wal/colors-tty.sh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/vvaxis/.lmstudio/bin"
# End of LM Studio CLI section

[ -f ~/.config/vdirsyncer/credentials ] && source ~/.config/vdirsyncer/credentials

# Created by `pipx` on 2026-01-27 06:11:52
export PATH="$PATH:/home/vvaxis/.local/bin"
