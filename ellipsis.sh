#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date June, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

# Install package
pkg.install() {
    if ! utils.cmd_exists ellipsis-compiler; then
        ellipsis install ellipsis-compiler
    fi

    EC_COMMENT='!'\
        ellipsis-compiler "$PKG_PATH/xmodmap.econf" "$PKG_PATH/xmodmap"
}

##############################################################################

# Link package
pkg.link() {
    fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/x"
}

##############################################################################

pkg.pull(){
    # Update dot-x repo
    git.pull

    # Update the config files
    EC_COMMENT='!'\
        ellipsis-compiler "$PKG_PATH/xmodmap.econf" "$PKG_PATH/xmodmap"
}

##############################################################################

# Unlink package
pkg.unlink() {
    hooks.unlink
}

##############################################################################

# Uninstall package
pkg.uninstall() {
    : #TODO
}

##############################################################################
