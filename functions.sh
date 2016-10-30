# X related functions

# Recal the xinitrc script
xinitrc() {
    if [ -f "$HOME/.xinitrc" ]; then
        "$HOME/.xinitrc"
    fi
}
