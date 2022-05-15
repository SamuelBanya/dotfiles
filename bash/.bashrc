# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Adding 'pywal' based .bashrc revision:
# (cat ~/.cache/wal/sequences &)
cat ~/.cache/wal/sequences

# Standard Bash Variable Section:
# Adjust PS1 variable:
declare -- PS1="\\[\\033[01;32m\\]\\u@\\h \\[\\033[01;34m\\]\\w \\[\$(R=\$?; [[ \$R != 0 ]] && echo -n \"\\033[01;31m\")\\]\\\$ \\[\\033[00m\\]"

# fzf specific declarations:
source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash

# Set the visual and editor to be Emacs by default:
export VISUAL=emacs
export EDITOR="$VISUAL"

# Set the browser to w3m:
export BROWSER=w3m
export GUIBROWSER=firefox

# Alias Section:
alias cgb="emacs ~/.bashrc"

alias home="cd $HOME"

alias ls="ls --color"

alias dir="dir --color"

alias scim="sc-im"

alias ne="newsboat && newsboat -e >> ~/hub/notes_private/rss_feeds/newsboat/currentNewsboatFeed.opml && newsboat -E ~/hub/notes_private/rss_feeds/newsboat/articlesRead.txt && cd ~/hub/notes_private && git add -A && git commit -m 'Adding latest rss feeds from newsboat' && git push origin master"

alias neo="neomutt"

alias w3="w3m -v"

alias w3b="w3m -B"

alias tm="tmux"

alias we="weechat"

alias za="zathura"

alias ytd="youtube-dl -o '~/Downloads/%(title)s-%(id)s.%(ext)s'"

alias ytdp="youtube-dl -o '~/Downloads/%(playlist_uploader)s_%(playlist_title)s_%(playlist_index)s_%(title)s.%(ext)s' $1"

alias ytds="youtube-dl --write-auto-sub --skip-download -o '~/Downloads/%(title)s-%(id)s.%(ext)s' $1 && cd ~/Downloads"

alias nmt="nmtui"

alias ran="ranger"

alias wea="curl wttr.in"

alias nem="neomutt"

alias pie="ssh sam@192.168.0.250"

alias rterm="~/utilities/coolretroterm/Cool-Retro-Term-1.1.1-x86_64.AppImage &"

alias sl="find ~/links && echo -e '\nWhich link would you like to go to?' && read linkLocation && echo -e '\nlinkLocation: $linkLocation'"

alias blog="cd ~/hub/public_html && emacs blog.org &"

alias cwd="pwd | xsel"

alias papabless="chmod 775 *"

alias learnc="cd ~/hub/scripts/c/01TheCProgrammingLanguageSecondEdition/ ; zathura ~/documents/books/ProgrammingBooks/TheCProgrammingLanguageSecondEdition.pdf &"

# 'cd' or 'change directory' based aliases:
alias cds="cd ~/hub/public_html"

# Fix Pulseaudio issues on any computer that has Pulseaudio issues
alias fixpulse="rm ~/.config/pulse -rf && pulseaudio --check && pulseaudio -D"

# Transmission Related Functions from 'gotbletu':
# My own aliases for Transmission:
alias tsm-stop="sudo /etc/init.d/transmission-daemon stop"
alias tsm-restart="sudo /etc/init.d/transmission-daemon restart"
PATH_SCRIPTS="$HOME/hub/scripts/bash/05UsefulBashScripts"
# gotbletu's Transmission functions:
tsm-clearcompleted() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;}
tsm() { transmission-remote --list ;}
# numbers of ip being blocked by the blocklist
tsm-count() { echo "Blocklist rules:" $(curl -s --data \
	'{"method": "session-get"}' localhost:9091/transmission/rpc -H \
	"$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
	| cut -d: -f 11 | cut -d, -f1) ;}
tsm-blocklist() { $PATH_SCRIPTS/blocklist.sh ;}		# update blocklist
tsm-daemon() { transmission-daemon ;}
tsm-quit() { killall transmission-daemon ;}
tsm-altspeedenable() { transmission-remote --alt-speed ;}	# limit bandwidth
tsm-altspeeddisable() {	transmission-remote --no-alt-speed ;}	# dont limit bandwidth
tsm-add() { transmission-remote --add "$1" ;}
tsm-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
tsm-pause() { transmission-remote -t"$1" --stop ;}		# <id> or all
tsm-start() { transmission-remote -t"$1" --start ;}		# <id> or all
tsm-purge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tsm-remove() { transmission-remote -t"$1" --remove ;}		# leaves data alone
tsm-info() { transmission-remote -t"$1" --info ;}
tsm-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}

# 'pywal' based adjustment
# Provide "$1" or the first positional argument as the image directory:
chw() {
    [[ $1 ]] && wal -i "$1" && feh --bg-fill "$1" && xrdb ~/.Xresources;
    # This next section utilizes 'ex' with is the ':' portion of 'Vim' but able
    # to be used in Bash scripts like this:
    background=$(ex -sc '/\*background:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    foreground=$(ex -sc '/\*foreground:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    # Previous command:
    # ex -sc '/theme.bg_normal/s/"[^"]\+"/"#RRGGBB"/;wq' ~/.config/awesome/themes/multicolor/theme.lua
    # Change background color in AwesomeWM theme config file:
    ex -c '/theme.bg_normal/s/"[^"]\+"/"'$background'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Change foreground color in AwesomeWM theme config file:
    ex -c '/theme.fg_normal/s/"[^"]\+"/"'$foreground'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Copy the wallpaper to the AwesomeWM 'multicolor' theme wallpaper directory:
    cp "$1" ~/.config/awesome/themes/multicolor/wall.png;
    # TODO:
    # Figure out how to call Ctrl+Super+r to reload 'awesome' with the latest changes:
}

# The 'g' ultimate version of the random change wallpaper function with Emacs Window Manager setup with Neovim instead of 'ex':
ranchwg() {
    wal -i ~/hub/pictures/wallpapers/ \
    && feh --bg-fill "$(< "${HOME}/.cache/wal/wal")" \
    && xrdb ~/.Xresources;
    # This next section utilizes 'ex' with is the ':' portion of 'Vim' but able
    # to be used in Bash scripts like this:
    background=$(nvim -e -sc '/\*background:/s/^\s\+\s\+//p|q!' ~/.cache/wal/colors.xresources);
    foreground=$(nvim -e -sc '/\*foreground:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    # Previous command:
    # ex -sc '/theme.bg_normal/s/"[^"]\+"/"#RRGGBB"/;wq' ~/.config/awesome/themes/multicolor/theme.lua
    # Change background color in AwesomeWM theme config file:
    # ex -c '/theme.bg_normal/s/"[^"]\+"/"'$background'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Change foreground color in AwesomeWM theme config file:
    # ex -c '/theme.fg_normal/s/"[^"]\+"/"'$foreground'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Restart AwesomeWM with the latest changes:
    # awesome-client <<< 'awesome.restart()';
}

# Openbox version of 'ranchw' function:
# /home/sam/pictures/wallpapers/BudapestParliamentBuildingAtNight4.jpg
# wallpaperImage=$(cat "${HOME}"/.cache/wal/wal)
# feh --bg-fill "${wallpaperImage}" \
ranchwob() {
    wal -i ~/pictures/wallpapers/;
    wallpaperImage=$(cat "${HOME}"/.cache/wal/wal);
    feh --bg-fill "${wallpaperImage}";
    sed -i "s|^feh.*|feh --bg-fill ${wallpaperImage}|" "${HOME}"/.config/openbox/autostart.sh;
    xrdb ~/.Xresources;
    # This next section utilizes 'ex' with is the ':' portion of 'Vim' but able
    # to be used in Bash scripts like this:
    background=$(nvim -e -sc '/\*background:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    foreground=$(nvim -e -sc '/\*foreground:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    # Previous command:
    # ex -sc '/theme.bg_normal/s/"[^"]\+"/"#RRGGBB"/;wq' ~/.config/awesome/themes/multicolor/theme.lua
    # Change background color in AwesomeWM theme config file:
    # ex -c '/theme.bg_normal/s/"[^"]\+"/"'$background'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Change foreground color in AwesomeWM theme config file:
    # ex -c '/theme.fg_normal/s/"[^"]\+"/"'$foreground'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Restart AwesomeWM with the latest changes:
    # awesome-client <<< 'awesome.restart()';
}

# Randomized Version of 'chw' command for Devuan with AwesomeWM based setup:
ranchw() {
    wal -i ~/pictures/wallpapers/ \
    && feh --bg-fill "$(< "${HOME}/.cache/wal/wal")" \
    && cp "$(< ~/.cache/wal/wal)" ~/.config/awesome/themes/multicolor/wall.png \
    && xrdb ~/.Xresources;
    # This next section utilizes 'ex' with is the ':' portion of 'Vim' but able
    # to be used in Bash scripts like this:
    background=$(ex -sc '/\*background:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    foreground=$(ex -sc '/\*foreground:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    # Previous command:
    # ex -sc '/theme.bg_normal/s/"[^"]\+"/"#RRGGBB"/;wq' ~/.config/awesome/themes/multicolor/theme.lua
    # Change background color in AwesomeWM theme config file:
    ex -c '/theme.bg_normal/s/"[^"]\+"/"'$background'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Change foreground color in AwesomeWM theme config file:
    ex -c '/theme.fg_normal/s/"[^"]\+"/"'$foreground'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Restart AwesomeWM with the latest changes:
    awesome-client <<< 'awesome.restart()';
}

# TRULY Randomized Version of 'chw' command in which the background wallpaper picture doesn't match the foreground colors:
truranchw() {
    wal -i ~/pictures/wallpapers && feh --randomize --bg-fill ~/pictures/wallpapers && xrdb ~/.Xresources;
    # This next section utilizes 'ex' with is the ':' portion of 'Vim' but able
    # to be used in Bash scripts like this:
    background=$(ex -sc '/\*background:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    foreground=$(ex -sc '/\*foreground:/s/^\S\+\s\+//p|q!' ~/.cache/wal/colors.Xresources);
    # Previous command:
    # ex -sc '/theme.bg_normal/s/"[^"]\+"/"#RRGGBB"/;wq' ~/.config/awesome/themes/multicolor/theme.lua
    # Change background color in AwesomeWM theme config file:
    ex -c '/theme.bg_normal/s/"[^"]\+"/"'$background'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Change foreground color in AwesomeWM theme config file:
    ex -c '/theme.fg_normal/s/"[^"]\+"/"'$foreground'"/|wq' ~/.config/awesome/themes/multicolor/theme.lua;
    # Copy the wallpaper to the AwesomeWM 'multicolor' theme wallpaper directory:
    cp "$1" ~/.config/awesome/themes/multicolor/wall.png;
    # TODO:
    # Figure out how to call Ctrl+Super+r to reload 'awesome' with the latest changes:
}

# YET ANOTHER wallpaper changing function, but more basic:
chgwal() {
     wal -i ~/hub/wallpapers/;
}

# fzf - Fuzzy Finder Based Configuration Settings:

# 'fzh': Fuzzy Finder File History
fzh() {
     eval $(history | fzf +s | sed 's/ *[0-9]* *//');
}

# C-z: fzf history (normal terminal): searches history and pipes it into fuzzy finder
# bind '"\C-z":"fh\n"'

# 'fzk': Fuzzy Finder Kill
fzk() {
     ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9};
}

# TODO: Find a better keybinding for this, doesn't play nice with w3m: C-q: fzk (kill process) (normal terminal): pipes processes into fzf to kill them
# bind  '"\C-q":"fk\n"'

# 'fcd': Fuzzy Finder Change Directory
fcd() {
     DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf) && cd "$DIR" ;
}

# fcd (change directory): TODO: Think of a good keybinding combo for this:
# bindkey '"\C-e":"fcd\n"'

# fzd: Fuzzy Finder Dmenu-Type Script To Run Desktop Apps From Terminal
fzd() {
	# note: xdg-open has a bug with .desktop files, so we cant use that shit
	selected="$(ls /usr/share/applications | fzf -e)"
	nohup `grep '^Exec' "/usr/share/applications/$selected" | tail -1 | sed 's/^Exec=//' | sed 's/%.//'` >/dev/null 2>&1&
}

# C-o: Fuzzy Finder Dmenu-Type Script To Run Desktop Apps From Terminal:
# bind '"\C-o":"fzd\n"'

fzw() {
    w3m $(sed -En 's/^[^"]+href="([^"]+)".*>([^<]+).*/\2\t\1/p' ~/.w3m/bookmark.html | sort -n | fzf -e | cut -f2)
}

# C-\: fzw() based keybinding: used to launch bookmarks from ~/.w3m/bookmark.html in w3m quickly from Tmux
# bind '"\C-\":"fzw\n"'

# reptyr Based function for Fuzzy Finder: this allows you to place a terminal launched program BACK into Tmux
fzr() {
    ps -Ao comm= | sort -n  | fzf -e | xargs pidof | xargs reptyr
}

# C-': fzr() based keybinding: used to move over standalone terminal applications BACK into Tmux
# TODO: Fix the keybinding present:
# bind '"\C-\'":"fzr\n"'

# 'updatedb' based function which updates the 'locate' database for the 'fzl' function
upd() {
    sudo updatedb;
}

fzl() {
    xdg-open "$(locate "*" | fzf -e)" ;
}

# M-\: fzl() based keybinding: used for Fuzzy Finder Locate to look for files throughout the entire system
# bind '"\M-\':"fzl\n"'

# Commit Based Aliases ('ct': commit):
alias ctg="cd ~/hub/guides && git add -A && git commit -m 'Adding latest guides' && git push home master"

# Copying Dotfiles And Commit Based Aliases ('cp': copy):
# Public "dotfiles" Repo Based Aliases:
alias cpa="cd ~/.config/awesome && cp rc.lua ~/hub/dotfiles/awesome/.config && cd ~/.config/awesome/themes/multicolor && cp theme.lua ~/hub/dotfiles/awesome/.config/awesome/themes/multicolor && cd ~/hub/dotfiles && git add -A && git commit -m 'Adding latest changes to Awesome config' && git push home master"

alias cpb="cd $HOME && cp .bashrc ~/hub/dotfiles/bash && cd ~/hub/dotfiles && git add -A && git commit -m 'Adding latest changes to bashrc' && git push home master"

alias cpe="cd ~/.emacs.d && cp configuration.org init.el ~/hub/dotfiles/emacs/.emacs.d/ && cd ~/hub/dotfiles/emacs && git add -A && git commit -m 'Adding latest changes to Emacs config' && git push home master"

alias cpn="cd ~/.newsboat && cp config urls ~/hub/dotfiles/newsboat/.newsboat && cd ~/hub/dotfiles && git add -A && git commit -m 'Adding latest changes to Newsboat config' && git push home master"

alias cpw="cd ~/.w3m && cp config keymap ~/hub/dotfiles/w3m/.w3m && cd ~/hub/dotfiles && git add -A && git commit -m 'Adding latest changes to w3m config' && git push home master"

alias cpt="cd $HOME && cp .tmux.conf ~/hub/dotfiles/tmux && cd ~/hub/dotfiles && git add -A && git commit -m 'Adding latest changes to tmux config' && git push home master"

alias cpx="cd $HOME && cp .Xresources ~/hub/dotfiles/Xresources && cd ~/hub/dotfiles && git add -A && git commit -m 'Adding latest changes to .Xresources config' && git push home master"

alias cpd="cd ~/hub/dotfiles && git add -A && git commit -m 'Adding latest changes to dotfiles' && git push home master"

alias cpdp="cd ~/hub/dotfiles_private && git add -A && git commit -m 'Adding latest changes to dotfiles_private' && git push home master"

# Run All Public Repo Commit Aliases At Once
alias cpall="cpa; cpb; cpn; cpw; cpt; cpx; cpd; cpdp;"

# Private "dotfiles_private" Repo Based Aliases
alias cpwe="cd ~/.weechat && cp irc.conf weechat.conf ~/hub/dotfiles_private/weechat/.weechat && cd ~/hub/dotfiles_private && git add -A && git commit -m 'Adding latest changes to Weechat config' && git push home master"

alias cpm="cd $HOME && cp .neomuttrc ~/hub/dotfiles_private/neomutt && cd ~/hub/dotfiles_private && git add -A && git commit -m 'Adding latest changes to Neomutt config' && git push home master"

# Run All Private Repo Commit Aliases At Once
alias cppall="cpwe; cpm;"

# Commenting this section out to later modify at a later date
# alias tmuxdlx="tmux; tmux send-keys 'weechat'; C-m; tmux split-window -h; tmux send-keys 'w3m duckduckgo.com'; C-m;"
alias rsyncsite="rsync -e 'ssh' -avzp /home/sam/hub/public_html/ root@104.131.2.109:/var/www/musimatic/"

alias krita="cd /home/sam/utilities/krita && ./krita-4.2.7.1b-x86_64.appimage"

alias fixmouse="sudo modprobe -r psmouse && sudo modprobe psmouse proto=imps"

# GNU Stow alias functions to help deploy deotfiles
deployT440S() { 
	cd "/home/sam/hub/dotfiles";
	stow -t ~ "bash/";
	cd "/home/sam/hub/dotfiles";
	stow -t ~ "emacs/";
	cd "/home/sam/hub/dotfiles";
	stow -t ~ "ranger/";
	cd "/home/sam//hub/dotfiles";
	stow -t ~ "tmux/";
	cd "/home/sam/hub/dotfiles";
	stow -t ~ "xmodmap_for_emacs/";
	cd "/home/sam/hub/dotfiles";
	stow -t ~ "openbox_ThinkpadT440s/";
	cd "/home/sam/hub/dotfiles";
	stow -t ~ "Xresources_ThinkpadT440s/";
	cd "/home/sam/hub/dotfiles";
	stow -t ~ "arandr_ThinkpadT440s/";
}

deployX230() {
    cd "/home/sam/hub/dotfiles";
    stow -t ~ "bash/";
    cd "/home/sam/hub/dotfiles";
    stow -t ~ "emacs/";
    cd "/home/sam/hub/dotfiles";
    stow -t ~ "ranger/"; 
    cd "/home/sam/hub/dotfiles";
    stow -t ~ "tmux/"; 
    cd "/home/sam/hub/dotfiles";
    stow -t ~ "xmodmap_for_emacs/";
}

DEBEMAIL="SBanya@outlook.com"
DEBFULLNAME="Samuel Banya"
export DEBEMAIL DEBFULLNAME
# Adding Devuan specific revision to include PATH variable in /sbin:
# export PATH=${PATH}:/sbin
# Adding Pywal specific PATH variable change:
export PATH="${PATH}:${HOME}/.local/bin/"

# Add Vimm's Lair downloader function set:
# For 'download3.vimm.net':
vimm-dl-3() {
    url=$1
    id="$(wget -qO- "$url" | grep 'name="mediaId' | sed 's/.*Id"\s*value="\([^"]*\)".*/\1/')"
    wget --header "Referer: $1" --header "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0" --content-disposition "https://download3.vimm.net/download/?mediaId=$id"
}

# For 'download4.vimm.net':
vimm-dl-4() {
    url=$1
    id="$(wget -qO- "$url" | grep 'name="mediaId' | sed 's/.*Id"\s*value="\([^"]*\)".*/\1/')"
    wget --header "Referer: $1" --header "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0" --content-disposition "https://download4.vimm.net/download/?mediaId=$id"
}

vimm-bulkdl-3() {
    file=$1
    while IFS= read line; do vimm-dl-3 $line; done < $file
}

vimm-bulkdl-4() {
    file=$1
    while IFS= read line; do vimm-dl-4 $line; done < $file
}

# For automounting and unmounting 'REDHDD'
alias mred="sshfs sam@fedoraserver:/media/REDHDD /home/sam/temp/REDHDD"
alias ured="sudo umount /home/sam/temp/REDHDD"

# For automounting and unmounting Manjaro desktop's HDD for streaming purposes
alias mman="sshfs sam@manjarodesktop:/home/sam /home/sam/temp/ManjaroDesktop"
alias uman="sudo umount /home/sam/temp/ManjaroDesktop"

# For allowing the backup drives on the Dell Optiplex to be mirrored properly:
# EDIT: Changed the resulting drive to be 'CTSSD' due to swapping out for a Crucial SSD on the file server:
mirrorDrives() {
    SOURCE='/media/REDHDD/'
    DEST='/media/CTSSD/'
    rsync -ahvAE --delete --stats $SOURCE $DEST 2>&1
}

# Adding 'NodeJS' support to 'notestation' computer
# Also, add 'yarn' package manager to 'notestation' computer
if [ "$HOSTNAME" = "notestation" ]; then
    source "/usr/share/nvm/init-nvm.sh"
    export PATH=$PATH:~/.yarn/bin
fi

# Adding 'xmodmap ~/.xmodmap' alias to get past stupid Manjaro XFCE's unwillingless to do this upon startup:
alias xmd='xmodmap ~/.xmodmap'

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

# Calibre Books
# Convert current directory's '.epub' files to '.pdf':
convert_epub_to_pdf(){
    local file ;
    for file in ./*.epub ;
    do ebook-convert "$file" "${file%.epub}.pdf" ;
       echo "Converted $file to .pdf" ;
    done
}

convert_mobi_to_pdf(){
    local file ;
    for file in ./*.mobi ;
    do ebook-convert "$file" "${file%.mobi}.pdf" ;
       echo "Converted $file to .pdf" ;
    done
}

convert_djvu_to_pdf(){
    local file ;
    for file in ./*.djvu ;
    do ebook-convert "$file" "${file%.djvu}.pdf" ;
       echo "Converted $file to .pdf" ;
    done
}

# Adding 'ihsec' specific function to trigger changes to Emacs config more easily
ihemacs() {
    ihsec del samsemacs ;
    ihsec install https://github.com/SamuelBanya/SamsEmacs samsemacs
    ihsec set samsemacs
}
