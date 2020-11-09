if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
fi

if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi
