export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git/' 2>/dev/null"
export FZF_DEFAULT_OPTS="--height 100% -e +i +s --bind ctrl-d:page-down,ctrl-u:page-up"

# fzf-z
export FZFZ_EXCLUDE_PATTERN=".cache|.git|.venv|node_modules"
export FZFZ_EXTRA_OPTS="--height 100%"

fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf-tmux -h 15 +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# zle     -N   fbr
# bindkey '^B' fbr
