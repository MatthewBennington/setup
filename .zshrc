autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[B" history-beginning-search-forward-end

autoload -U colors
colors
PS1="%(?,%{$fg[green]%},%{$fg[red]%}) %% "
RPS1="%{$fg[blue]%}%~%{$reset_color%} "

alias l='ls -la'
alias gcc='g++'
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export VISUAL=nvim
export EDITOR="$VISUAL"
alias vim=nvim

function pdf () {
        cupsfilter $1 > "${1%.*}.pdf" 2> /dev/null
}

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
