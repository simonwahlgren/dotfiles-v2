# tab completion on hidden folders
zstyle ':completion:*' special-dirs true

# don't trust cache - rehash on completion
# zstyle ":completion:*:commands" rehash 1

# Disable flow control (ctrl+s, ctrl+q) to enable saving with ctrl+s in Vim
stty -ixon -ixoff

# Disable the capslock key and map it to escape
#
# for some reason xmodmap is reset if the keyboard is disconnected
#
# to "fix" this lets run xmodmap everytime we start a terminal
# (sleep 0.2 && xmodmap ~/.Xmodmap)
setxkbmap -option caps:escape
