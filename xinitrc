# @file xinitrc
# @date June, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

if [ -f "$HOME/.config/x/Xmodmap" ]; then
    xmodmap "$HOME/.config/x/Xmodmap"
fi

if [ -f "$HOME/.config/x/xinputrc" ]; then
    "$HOME/.config/x/xinputrc"
fi

##############################################################################

# Disable screen blanking
xset s off && xset -dpms

##############################################################################
