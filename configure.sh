#!/usr/bin/env bash

ok() {
    printf "\e[0;32m[ OK ]\e[0m\t$1\n"
}

fail() {
    printf "\e[0;31m[FAIL]\e[0m\t$1\n"
    exit 1
}

info() {
    printf "[INFO]\t$1\n"
}

backupIfExisting() {
    if [ -e "$1" ]; then
        info "'$1' already exists - creating backup"
        current_time=$(date "+%Y_%m_%d-%H_%M_%S")
        mv "$1" "$1__$current_time.backup"
    fi
}

createLink() {
    ln -s -f $1 $2

    if [ "$?" -ne 0 ]; then
        fail "Unable to create link $1 --> $2"
    fi
}

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
NVIM_CONF_DIR=$HOME/.config/nvim
NVIM_TEMP_DIR=$NVIM_CONF_DIR/tmp

backupIfExisting $NVIM_CONF_DIR
mkdir -p $NVIM_TEMP_DIR

createLink $SCRIPT_DIR/init.vim $NVIM_CONF_DIR/init.vim
createLink $SCRIPT_DIR/config $NVIM_CONF_DIR/config
createLink $SCRIPT_DIR/ftplugin $NVIM_CONF_DIR/ftplugin
createLink $SCRIPT_DIR/coc-settings.json $NVIM_CONF_DIR/coc-settings.json

# Install python support for neovim
info "Installing python support for neovim"
python -m pip install neovim jedi flake8 autopep8 isort

# Install vim-plug
info "Installing plugins"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Plugins
nvim -u "$NVIM_CONF_DIR/config/plugins.vim" +PlugInstall +qa!

info "Plugins installed"
ok "Configuration complete"