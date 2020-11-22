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

alias -g G=" | grep"
alias -g R=" | rg"

alias yay="yay --answerclean Y --answerdiff N --answeredit N --cleanafter --removemake"
alias pinstall="yay -S"
alias psearch="yay -Ss"
alias premove="sudo pacman -Rsn"
alias pupdate="sudo pacman -Syy"
alias pupgrade="sudo pacman -Syyu && yay -Sua"
alias pfind="yay -Qs"
alias pclean="sudo pacman -Scc"
alias pfile="pkgfile"

alias gs="git status -s"
alias gss="git status"
alias glog="git log --no-merges --abbrev-commit --oneline --color=always '--pretty=format:%Cred%h%Creset - %s %Cgreen(%cd) %C(bold blue)<%an>%Creset ' --date=short --all"
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
alias ghpr="gh pr create -f"

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
function kexec(){ pod=$1; shift; kubectl exec -it $pod -- $@; }

alias stern="stern --tail 100"
