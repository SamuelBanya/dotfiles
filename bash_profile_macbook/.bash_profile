if [ -r ~/.bashrc ]; then
    source ~/.bashrc
fi

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.bash 2>/dev/null || :

# Created by `pipx` on 2025-05-06 03:51:30
export PATH="$PATH:/Users/sam/.local/bin"

##
# Your previous /Users/sam/.bash_profile file was backed up as /Users/sam/.bash_profile.macports-saved_2026-02-23_at_00:49:18
##

# MacPorts Installer addition on 2026-02-23_at_00:49:18: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

