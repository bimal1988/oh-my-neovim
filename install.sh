#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
NVIM_CONF_DIR=$HOME/.config/nvim
NVIM_TEMP_DIR=$NVIM_CONF_DIR/tmp
PLUG_INSTALL_DIR=$NVIM_CONF_DIR/autoload
PLUG_DOWNLOAD_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

main() {
    need_cmd nvim
    need_cmd python3
    need_cmd node
    need_cmd npm
    need_cmd npx
    need_cmd yarn
    need_cmd mkdir
    need_cmd ln
    need_cmd date
    need_cmd printf
    downloader --check

    if [ -e $NVIM_CONF_DIR ]; then
        info "Found existing neovim configuration, creating backup.."
        current_time=$(date "+%Y_%m_%d-%H_%M_%S")
        local backup_dir="$NVIM_CONF_DIR"__"$current_time".backup
        ensure mv "$NVIM_CONF_DIR" "$backup_dir"
        info "Created backup at $backup_dir"
    fi

    info "Creating configuration directory structure.."
    ensure mkdir -p $NVIM_CONF_DIR
    ensure mkdir -p $NVIM_TEMP_DIR
    ensure mkdir -p $PLUG_INSTALL_DIR

    info "Creating links to configuration files.."
    ensure ln -s -f $SCRIPT_DIR/init.vim $NVIM_CONF_DIR/init.vim
    ensure ln -s -f $SCRIPT_DIR/config $NVIM_CONF_DIR/config
    ensure ln -s -f $SCRIPT_DIR/ftplugin $NVIM_CONF_DIR/ftplugin
    ensure ln -s -f $SCRIPT_DIR/coc-settings.json $NVIM_CONF_DIR/coc-settings.json

    info "Installing python support for neovim.."
    python3 -m pip install neovim flake8 autopep8 isort

    info "Downloading vim plug.."
    ensure downloader "$PLUG_DOWNLOAD_URL" "$PLUG_INSTALL_DIR/plug.vim"

    info "Installing neovim plugins.."
    ensure nvim --headless -u "$NVIM_CONF_DIR/config/plugins.vim" +PlugInstall +qall

    ok "Configuration complete"
}

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

need_cmd() {
    if ! check_cmd "$1"; then
        fail "need '$1' (command not found)"
    fi
}

check_cmd() {
    command -v "$1" > /dev/null 2>&1
}

# Run a command that should never fail. If the command fails execution
# will immediately terminate with an error showing the failing
# command.
ensure() {
    if ! "$@"; then fail "command failed: $*"; fi
}

# This wraps curl or wget. Try curl first, if not installed,
# use wget instead.
downloader() {
    local _dld
    if check_cmd curl; then
        _dld=curl
    elif check_cmd wget; then
        _dld=wget
    else
        _dld='curl or wget' # to be used in error message of need_cmd
    fi

    if [ "$1" = --check ]; then
        need_cmd "$_dld"
    elif [ "$_dld" = curl ]; then
        if ! check_help_for curl --proto --tlsv1.2; then
            echo "Warning: Not forcing TLS v1.2, this is potentially less secure"
            curl --silent --show-error --fail --location "$1" --output "$2"
        else
            curl --proto '=https' --tlsv1.2 --silent --show-error --fail --location "$1" --output "$2"
        fi
    elif [ "$_dld" = wget ]; then
        if ! check_help_for wget --https-only --secure-protocol; then
            echo "Warning: Not forcing TLS v1.2, this is potentially less secure"
            wget "$1" -O "$2"
        else
            wget --https-only --secure-protocol=TLSv1_2 "$1" -O "$2"
        fi
    else
        err "Unknown downloader" # should not reach here
    fi
}

check_help_for() {
    local _cmd
    local _arg
    local _ok
    _cmd="$1"
    _ok="y"
    shift

    # If we're running on OS-X, older than 10.13, then we always
    # fail to find these options to force fallback
    if check_cmd sw_vers; then
        if [ "$(sw_vers -productVersion | cut -d. -f2)" -lt 13 ]; then
            # Older than 10.13
            echo "Warning: Detected OS X platform older than 10.13"
            _ok="n"
        fi
    fi

    for _arg in "$@"; do
        if ! "$_cmd" --help | grep -q -- "$_arg"; then
            _ok="n"
        fi
    done

    test "$_ok" = "y"
}

main "$@" || exit 1
