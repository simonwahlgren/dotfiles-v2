ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source ~/.zplug/init.zsh
zplug "mafredri/zsh-async"
zplug "woefe/git-prompt.zsh"
# Load completion library for those sweet [tab] squares
# zplug "lib/completion", from:oh-my-zsh
zplug "plugins/shrink-path", from:oh-my-zsh
# zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
zplug "lib/spectrum", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh, use:key-bindings.zsh
zplug "rupa/z", use:z.sh
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh, defer:2
zplug "wulfgarpro/history-sync", use:history-sync.plugin.zsh

FORGIT_NO_ALIASES=1
zplug "wfxr/forgit"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# Load all files from .zsh
if [ -d $HOME/.zsh ]; then
  for file in $HOME/.zsh/*.zsh; do
    source $file
  done
fi

# Load all files from .zsh/plugins
if [ -d $HOME/.zsh/plugins ]; then
  for file in $HOME/.zsh/plugins/*.zsh; do
    source $file
  done
fi

HISTFILE_NAME=.zsh_histfile
HISTFILE="${HOME}/${HISTFILE_NAME}"
HISTSIZE=100000
SAVEHIST=100000

# hist-sync
ZSH_HISTORY_FILE="${HISTFILE}"
ZSH_HISTORY_PROJ="${HOME}/.zsh_history_proj"
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/${HISTFILE_NAME}.gpg"

setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt INC_APPEND_HISTORY     # add commands to HISTFILE in order of execution
setopt SHARE_HISTORY          # share command history data
setopt HIST_IGNORE_ALL_DUPS   # ignore duplicates in search history

bindkey -e

# only show past commands that include the current input
# move cursor to the of line after each match
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

autoload -U zcalc

# partial completions
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# zstyle ':completion:*:*:*:default' menu yes select search

# custom prompts location
fpath=( "$HOME/.zsh/themes/" $fpath )

# enable auto completion
autoload -Uz compinit
compinit

setopt complete_aliases

# colored prompt
autoload -Uz promptinit
promptinit

setopt prompt_subst

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
prompt_virtualenv() { [[ -n $VIRTUAL_ENV && -n $VIRTUAL_ENV_DISABLE_PROMPT ]] && echo "%{$FX[bold]$FG[055]%}($(basename $VIRTUAL_ENV)) "; }
autoload -Uz get_pwd
autoload -Uz prompt_virtualenv
autoload -Uz promptinit && promptinit
autoload -U colors && colors

PROMPT='$(get_pwd) $(gitprompt) $(prompt_virtualenv)$FX[bold]$FG[055]
〉%{$reset_color%} '

# avoid the need to manually reset the terminal
ttyctl -f

# rehash automatically
zstyle ':completion:*' rehash true

# auto complete aliases
setopt no_complete_aliases

# Automatically use cd when paths are entered without cd
setopt autocd

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
