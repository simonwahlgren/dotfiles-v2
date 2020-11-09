# Use CTRL+arrow keys to jump words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^ ' autosuggest-accept
bindkey '^[^M' autosuggest-execute

bindkey -s '^o' 'kubectx\n'
