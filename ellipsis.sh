#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date June, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

compile_config() {
    EC_COMMENT='!'\
        ellipsis-compiler "$PKG_PATH/Xmodmap.econf" "$PKG_PATH/Xmodmap"

    ellipsis-compiler "$PKG_PATH/xinputrc.econf" "$PKG_PATH/xinputrc"
}

##############################################################################

pkg.init() {
    . "$PKG_PATH/functions.sh"
}

##############################################################################

pkg.install() {
    if ! utils.cmd_exists ellipsis-compiler; then
        ellipsis install ellipsis-compiler
    fi

    compile_config
}

##############################################################################

pkg.link() {
    # Link into ~/.config/x
    mkdir -p "$ELLIPSIS_HOME/.config"
    fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/x"

    # Link files
    fs.link_file "$PKG_PATH/xinitrc"
    fs.link_file "$PKG_PATH/Xmodmap"
}

##############################################################################

pkg.pull(){
    # Update dot-x repo
    git.pull

    # Update the config files
    compile_config
}

##############################################################################

pkg.unlink() {
    # Remove link in ~/.config
    rm "$ELLIPSIS_HOME/.config/x"

    # Remove links in the home folder
    hooks.unlink
}

##############################################################################

pkg.uninstall() {
    : #No action
}

##############################################################################
