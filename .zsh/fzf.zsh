export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!.git' -g '!node_modules' -g '!.venv' 2>/dev/null"
export FZF_DEFAULT_OPTS="--height 100% -e +i +s --bind ctrl-d:page-down,ctrl-u:page-up"

fbr() {
  local branches branch
  branches=$(git branch)
  branch=$(echo "$branches" | fzf-tmux -d '15%')
  git checkout $(echo "$branch" | sed "s/.* //")
}
zle     -N   fbr
bindkey '^B' fbr

fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0)
  tmux switch-client -t "$session"
}

fz() {
  local z_path
  z_path=$(z -l | fzf-tmux -d '100%' | awk '{print $2}')
  cd $(echo "$z_path")
}
zle     -N   fz
bindkey '^G' fz
