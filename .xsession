xhost +si:localuser:root

export SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass
eval $(keychain --eval --quiet ~/.ssh/id_ed25519 ~/.ssh/id_creatorstudio)
