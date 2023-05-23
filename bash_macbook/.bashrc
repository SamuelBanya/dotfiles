# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

declare -- PS1="\\[\\033[01;32m\\]\\u@\\h \\[\\033[01;34m\\]\\w \\[\$(R=\$?; [[ \$R != 0 ]] && echo -n \"\\033[01;31m\")\\]\\\$ \\[\\033[00m\\]"

# GitHub GPG specific:
export GPG_TTY=$(tty)

# Aliases:
alias tm="tmux"
alias dir="ls"

# Brendan's cool Bash alias for creating containers on the fly for testing purposes
alias snykclienv='f() { sudo docker run --rm -it --workdir $(pwd) -v $(pwd):$(pwd) -e SNYK_TOKEN="$(snyk config get api)" --entrypoint bash snyk/snyk-cli:$1 };f'

# Java specific Bash variables:
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.0.1.jdk/Contents/Home
export PATH=/Users/$USER/Applications/apache-maven-3.8.3/bin:$PATH

# Silent zsh shell reminder
# https://linuxpip.org/zsh-macos-default-shell-guide/
export BASH_SILENCE_DEPRECATION_WARNING=1

# Google Go programming language specific variables:
# https://ahmadawais.com/install-go-lang-on-macos-with-homebrew/
export GOPATH="${HOME}/.go"

export GOROOT="$(brew --prefix golang)/libexec"

export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"

test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Ruby specific variables:
export GEM_HOME="$HOME/.gem"

# Adding support for 'emacs-libvterm':
# This is a function taken from the related GitHub page which passes in the relevant escape sequences to make directory
# tracking possible:
# https://github.com/akermu/emacs-libvterm#shell-side-configuration
vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

# This function is taken from the related GitHub page that allows the 'PS1' variable to contain the necessary information
# for directory tracking in 'vterm' within Emacs:
# https://github.com/akermu/emacs-libvterm#user-content-directory-tracking-and-prompt-tracking
vterm_prompt_end(){
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
PS1=$PS1'\[$(vterm_prompt_end)\]'

# 'nvm' configuration:
export NVM_DIR="$HOME/.nvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add 'jiggle-mouse' based alias:
alias jmo="cd /Users/samuelbanya/hub/worknotes_snyk/jiggly-mouse && python3 jiggly-mouse.py"

# Adding 'ihsec' specific function to trigger changes to Emacs config more easily
ihemacs() {
    ihsec del samsemacs ;
    ihsec install https://github.com/SamuelBanya/SamsEmacs samsemacs
    ihsec set samsemacs
}

# Add VS Code's 'code .' command:
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# Add 'brew' to path for M1 Mac:
# From here:
# https://stackoverflow.com/questions/65487249/getting-a-warning-when-installing-homebrew-on-macos-big-sur-m1-chip
export PATH="/opt/homebrew/bin:$PATH"

# Adding 'gls' to PATH for Emacs based 'Dired' switches to group directories first alphabetically:
# From here:
# https://github.com/d12frosted/homebrew-emacs-plus/issues/383
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
