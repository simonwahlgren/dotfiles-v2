export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!.git' -g '!node_modules' -g '!.venv' 2>/dev/null --sort path"
export FZF_DEFAULT_OPTS="--height 100% +i --bind ctrl-d:page-down,ctrl-u:page-up --exact"
# remove first column in history
export FZF_CTRL_R_OPTS='--with-nth 2..'

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
  z_path=$(z -l | awk '{print $2}' | sort | fzf-tmux -d '100%')
  cd $(echo "$z_path")
}
zle     -N   fz
bindkey '^G' fz
