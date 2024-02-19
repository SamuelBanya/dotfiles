# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# From this Medium article:
# https://medium.com/@chiraggandhi70726/how-to-add-git-branch-name-to-bash-prompt-b112b93606e#:~:text=In%20order%20to%20add%20a,bash_profile).
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

declare -- PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# GitHub GPG specific:
export GPG_TTY=$(tty)

# Aliases:
alias tm="tmux"
alias dir="ls"

# Add 'brew' to path for M1 Mac:
# From here:
# https://stackoverflow.com/questions/65487249/getting-a-warning-when-installing-homebrew-on-macos-big-sur-m1-chip
export PATH="/opt/homebrew/bin:$PATH"

# Silent zsh shell reminder
# https://linuxpip.org/zsh-macos-default-shell-guide/
export BASH_SILENCE_DEPRECATION_WARNING=1

# 'nvm' configuration:
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Add VS Code's 'code .' command:
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# Adding 'gls' to PATH for Emacs based 'Dired' switches to group directories first alphabetically:
# From here:
# https://github.com/d12frosted/homebrew-emacs-plus/issues/383
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Adding 'DOTNET_ROOT' because of AWS Codeartifact:
# Related StackOverflow post:
# https://stackoverflow.com/questions/74895147/how-to-fix-dotnet-ef-tool-net-location-not-found
# export DOTNET_ROOT="/usr/local/share/dotnet"

# NOTE (12-19-2024):
# Commenting this out for now as requested by work:
# Adding 'NODE_TLS_REJECT_UNAUTHORIZED' environment variable to allow for 'yarn build' to work on the M1 Macbook:
# export NODE_TLS_REJECT_UNAUTHORIZED=0
