# @file xinitrc
# @date June, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

if [ -f "$HOME/.conf/x/xmodmap" ]; then
    xmodmap "$HOME/.conf/x/xmodmap"
fi

##############################################################################
