
function trybackup()
{
    source_file=$1
    target_bkp_path=$2
    [ -f "$source_file" ] && cp "$source_file" "$target_bkp_path"
}

function tryloadbackup()
{
    source_file=$1
    target_bkp_path=$2
    [ -f "$source_file" ] && cp "$target_bkp_path" "$source_file"
}

function dots-bkp()
{
    bkp_folder=$PFILES_DIR/${CURRENT_MACHINE}_machine/bkp/

    # Installation
    trybackup $HOME/.bash_install $bkp_folder

    # Aliases
    trybackup $HOME/.bash_aliases $bkp_folder

    # Another configs
    trybackup $HOME/.profile_config $bkp_folder
    trybackup $HOME/.bashrc_config $bkp_folder
    trybackup $HOME/.gitconfig $bkp_folder

    current_dir=$PWD
    cd $PFILES_DIR
    git add $bkp_folder
    git commit -m "Update dots files for machine $CURRENT_MACHINE"
    git remote update
    git rebase origin/master
    git push origin master
    cd $current_dir
}

function dots-update-from-bkp()
{
    bkp_folder=$PFILES_DIR/${CURRENT_MACHINE}_machine/bkp/

    # Installation
    tryloadbackup $HOME/.bash_install $bkp_folder/.bash_install

    # Aliases
    tryloadbackup $HOME/.bash_aliases $bkp_folder/.bash_aliases

    # Another configs
    tryloadbackup $HOME/.profile_config $bkp_folder/.profile_config
    tryloadbackup $HOME/.bashrc_config $bkp_folder/.bashrc_config
    tryloadbackup $HOME/.gitconfig $bkp_folder/.gitconfig
}