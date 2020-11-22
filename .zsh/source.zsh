if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
fi

if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi

if command -v gh >/dev/null 2>&1; then
    eval "$(gh completion -s zsh)"
fi

if [ -f /opt/google-cloud-sdk/path.zsh.inc ]; then
  source '/opt/google-cloud-sdk/path.zsh.inc'
fi

if [ -f /opt/google-cloud-sdk/completion.zsh.inc ]; then
  source '/opt/google-cloud-sdk/completion.zsh.inc'
fi

if [ -f $(dirname $0)/secrets.zsh ]; then
    source $(dirname $0)/secrets.zsh 2>/dev/null
fi

if [ -f /opt/azure-cli/az.completion ]; then
    # enable bash completion
    autoload bashcompinit && bashcompinit
    source '/opt/azure-cli/az.completion'
fi
