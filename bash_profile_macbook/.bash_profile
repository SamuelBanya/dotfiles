if [ -r ~/.bashrc ]; then
    source ~/.bashrc
fi

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.bash 2>/dev/null || :

# Created by `pipx` on 2025-05-06 03:51:30
export PATH="$PATH:/Users/sam/.local/bin"
