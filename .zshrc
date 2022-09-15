#########################################
# General
#########################################
# avoid the need to manually reset the terminal
ttyctl -f
# disable flow control (ctrl+s, ctrl+q) to enable saving with ctrl+s in Vim
stty -ixon -ixoff
# disable the caps lock key and map it to escape
setxkbmap -option caps:escape

# enable builtin calculator
autoload -U zcalc
# enable auto completion
autoload -Uz compinit && compinit

# rehash automatically
zstyle ':completion:*' rehash true
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# zstyle ':completion:*:*:*:default' menu yes select search
# tab completion on hidden folders
zstyle ':completion:*' special-dirs true

# automatically use cd when paths are entered without cd
setopt autocd

#########################################
# History
#########################################
HISTFILE_NAME=.zsh_histfile
HISTFILE="${HOME}/${HISTFILE_NAME}"
HISTSIZE=100000
SAVEHIST=100000

# record timestamp of command in HISTFILE
setopt EXTENDED_HISTORY
# ignore duplicated commands history list
setopt HIST_IGNORE_DUPS
# ignore commands that start with space
setopt HIST_IGNORE_SPACE
# show command with history expansion to user before running it
setopt HIST_VERIFY
# add commands to HISTFILE in order of execution
setopt INC_APPEND_HISTORY
# share command history data
setopt SHARE_HISTORY
# ignore duplicates in search history
setopt HIST_IGNORE_ALL_DUPS

#########################################
# Prompt
#########################################
# custom prompt theme location
fpath=( "$HOME/.zsh/themes/" $fpath )

get_pwd() {
    git_root=$PWD
    while [[ $git_root != / && ! -e $git_root/.git ]]; do git_root=$git_root:h; done
    case $git_root in
    /)
      echo %{$FX[bold]$FG[026]%}$(shrink_path -f)%{$reset_color%}
      ;;
    $PWD)
      echo %{$FX[bold]$FG[026]%}$(shrink_path -f $git_root)%{$reset_color%}
      ;;
    *)
      echo %{$FX[bold]$FG[026]%}$(shrink_path -f $git_root)%{$reset_color%}%{$fg_bold[magenta]%}${$(shrink_path -f)#$(shrink_path -s -t $git_root)}%{$reset_color%}
      ;;
  esac
}
autoload -Uz get_pwd
autoload -Uz promptinit && promptinit
autoload -U colors && colors

# ?
setopt prompt_subst

# customize prompt
PROMPT='$(get_pwd) $(gitprompt) $FX[bold]$FG[055]
〉%{$reset_color%} '

#########################################
# Aliases
#########################################
alias ls="ls -lsh --color=auto"
alias cal="cal -3 -m -w"
alias free="free -h -w -t"
alias dmesg="dmesg -T"
alias weather='curl http://wttr.in/Stockholm'
alias jobs="jobs -p"
alias top="htop"
alias resolvconf="sudo nvim /etc/resolv.conf"
alias zcalc="zcalc -f"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias etcfiles='sudo -E /usr/bin/git --git-dir=$HOME/.etcfiles/ --work-tree=/etc'
alias bc="zcalc"
alias grep="grep --colour=always"
alias t="tree -C | less -r"
alias pscpu="ps -eo pcpu,pid,user,args | sort -r -k1 | less"
alias open="xdg-open"
alias errors="journalctl -p 3 -b -f"

alias -g G=" | grep"
alias -g R=" | rg"

alias yay="yay --answerclean Y --answerdiff N --answeredit N --cleanafter --removemake"
alias pinstall="yay -S"
alias psearch="yay -Ss"
alias premove="sudo pacman -Rsn"
alias pupdate="sudo pacman -Syy"
alias pupgrade="sudo pacman -Syyu && yay -Sua"
alias pfind="yay -Qs"
alias pown="pacman -Qo"
alias plist="pacman -Ql"
alias pclean="pacman -Qtdq | sudo pacman -Rns -"

alias gs="git status -s"
alias gss="git status"
alias glog="git log --no-merges --abbrev-commit --oneline --color=always '--pretty=format:%Cred%h%Creset - %s %Cred%d%Creset %Cgreen(%cd) %C(bold blue)<%an>%Creset ' --date=short"
alias glogg="git log --graph --pretty=format:'%C(124)%ad %C(24)%h %C(34)%an %C(252)%s%C(178)%d' --date=short"
alias gf="git fetch"
alias ga="git add"
alias gd="git diff"
alias gdc="git diff --cached"
alias gba="git branch -vva"
alias gl="git pull"
alias gp="git push"
alias gc="git commit"
alias gc!="git commit -v --amend"
alias gco="git checkout"
alias grhh="git reset --hard"
alias gstp="git stash pop"
alias gst="git stash"
alias gcm="git checkout master"
alias gdn="git diff --no-ext-diff"
alias gcd="cd $(git root)"
alias gb="git brv"

alias ghb="gh repo view -w"
alias ghpr="gh pr create -f -d"

alias nano="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

alias dc="docker-compose"
alias dcr="docker-compose down -v ; docker-compose up -d"
alias dcd="docker-compose rm -f -s"
alias dcl="docker-compose logs -f --tail=100"
function dexec(){ container=$1; shift; docker exec -it $container $@; }

# get latest docker container id
function dlc(){ docker ps | cut -d" " -f1 | head -2 | tail -1 }
function dll(){ docker logs -f $(dlc) }
function del(){ docker exec -ti $(dlc) bash }

alias sys="sudo systemctl"
alias sys_reload="sudo systemctl daemon-reload"

alias venv="python -m venv .venv"
alias pyclean="find . -regex '^.*\(__pycache__\|\.py[co]\)$' -delete"

alias pipf="pip freeze"
alias pipu="pip freeze | xargs pip uninstall -y"
alias pipi="pip install --process-dependency-links -U -r"
alias pipo="pip list --outdated --format=columns"

alias ssh="TERM=screen-256color ssh"
alias tp="PS1='# ' telepresence"

alias k="kubectl"
alias kl="kubectl logs --tail=100 -f"
alias kg="kubectl get"
alias kp="kubectl get pods -o wide"
alias ke="kubectl exec -ti"
alias kd="kubectl describe pod"
alias kx="kubectx"

#########################################
# Plugin manager
#########################################
# bootstrap
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit snippet OMZ::lib/spectrum.zsh
zinit snippet OMZ::lib/key-bindings.zsh

zinit snippet OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
# shrink directory paths for brevity and pretty-printing
zinit snippet OMZ::plugins/shrink-path/shrink-path.plugin.zsh
# adds keyboard shortcuts for navigating directory history and hierarchy
# zinit snippet OMZ::plugins/dirhistory/dirhistory.plugin.zsh
# datetime aliases, isodate, isodate_utc, isodate_basic, unixtimestamp, date_local
zinit snippet OMZ::plugins/isodate/isodate.plugin.zsh

zinit light rupa/z
zinit light MichaelAquilina/zsh-autoswitch-virtualenv

# auto suggestions
zinit light zsh-users/zsh-autosuggestions
# use CTRL+arrow keys to jump words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^ ' autosuggest-accept
bindkey '^[^M' autosuggest-execute

# completions
# https://git.lmburns.com/dotfiles/file/.config/zsh/.zshrc.html
zinit wait lucid light-mode as'completion' for \
  id-as'poetry_comp' atclone='poetry completions zsh > _poetry' \
  atpull'%atclone' has'poetry' \
    zdharma-continuum/null

# zinit light "wulfgarpro/history-sync"
# ZSH_HISTORY_FILE="${HISTFILE}"
# ZSH_HISTORY_PROJ="${HOME}/.zsh_history_proj"
# ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/${HISTFILE_NAME}.gpg"

#########################################
# Local configuration
#########################################
if [ -d $HOME/.zsh ]; then
  for file in $HOME/.zsh/*.zsh; do
    source $file
  done
fi

if [ -d $HOME/.zsh/plugins ]; then
  for file in $HOME/.zsh/plugins/*.zsh; do
    source $file
  done
fi

#########################################
# 3rd party configuration
#########################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
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
    autoload bashcompinit && bashcompinit
    source '/opt/azure-cli/az.completion'
fi

if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
fi

if command -v gh >/dev/null 2>&1; then
    eval "$(gh completion -s zsh)"
fi
