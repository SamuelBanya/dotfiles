# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

declare -- PS1="\\[\\033[01;32m\\]\\u@\\h \\[\\033[01;34m\\]\\w \\[\$(R=\$?; [[ \$R != 0 ]] && echo -n \"\\033[01;31m\")\\]\\\$ \\[\\033[00m\\]"

# Aliases:
alias tm="tmux"

alias dir="ls"

# Silencing 'zsh' output as per this StackOverflow post recommendation:
# https://apple.stackexchange.com/questions/371997/suppressing-the-default-interactive-shell-is-now-zsh-message-in-macos-catalina
# export BASH_SILENCE_DEPRECATION_WARNING=1
