
if [ "$(uname)" == "Darwin" ]; then
    source $DOTFILES_DIR/osx/export.sh
elif [[ $0 == *termux* ]]; then
    source $DOTFILES_DIR/termux/export.sh
fi

