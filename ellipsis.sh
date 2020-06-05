##############################################################################
# @file ellipsis.sh
# @date June, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

# Minimal ellipsis version
ELLIPSIS_VERSION_DEP='1.9.4'

# Package dependencies (informational/not used!)
ELLIPSIS_PKG_DEPS=''

##############################################################################

compile_config() {
    cat "$PKG_PATH/xinputrc.main" > "$PKG_PATH/xinputrc"
    if [ -f ~/.local/x/xinputrc ]; then
        cat ~/.local/x/xinputrc >> "$PKG_PATH/xinputrc"
    fi
    chmod +x "$PKG_PATH/xinputrc"
}

##############################################################################

pkg.install() {
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

pkg.pull() {
    # Use improved update strategy
    git remote update 2>&1 > /dev/null
    if git.is_behind; then
        pkg.unlink
        git.pull
        pkg.link

        # Update the config files
        compile_config
    fi
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
    : # No action
}

##############################################################################
