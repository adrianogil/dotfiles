function trysource()
{
    source_file=$1
    [ -f "$source_file" ] && source "$source_file"
}

# Installation
trysource $HOME/.bash_install

# Aliases
trysource $HOME/.bash_aliases

# Another configs
trysource $HOME/.profile_config
trysource $HOME/.bashrc_config
