#####################################################
#                                                   #
# Matt's zsh config.                                #
# Created because I found that I relied to heavily  #
# on oh-my-zsh's features. It replicates most of    #
# the features I used frequently in oh-my-zsh.      #
# Plus it adds a handful of functions which I like. #
# NOTE: A few commands here are MacOS specific,     #
# try to mark them when they come up, but I may miss#
# some, expect an error or two if you run this on a #
# linux box.                                        #
#                                                   #
# Matt Jones - mattbrucejones@gmail.com             #
#                                                   #
#####################################################

# These lines replicate oh-my-zsh's history search functionality.
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[B" history-beginning-search-forward-end

# Docker completion:
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
fpath=( /Users/Matt/.zsh/completion "${fpath[@]}" )

# Replicates oh-my-zsh's case-insensitive completion.
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

# Prompt stuff, modeled after oh-my-zsh's terminal-party prompt.
autoload -U colors
colors
PS1="%(?,%{$fg[green]%},%{$fg[red]%}) %% "
RPS1="%{$fg[blue]%}%~%{$reset_color%} "

# ALIASES

# Docker stuff to make life less painfull.
alias dkill="docker kill $(docker ps -aq)"

# Set python commands to default to python3, because I would forget otherwise.
alias python='python3'
alias pip='pip3'

# Replicating oh-my-zsh features.
alias cd='pushd'
alias l='ls -la'

# I almost never write c, and this catches stupid mistakes.
alias gcc='g++'

# Stuff I need in my path.
export PATH=/usr/local/bin/:$PATH
export PATH=/Library/TeX/texbin:$PATH

# Zsh syntax highlighting, more info:
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Setting text editor.
export VISUAL=nvim
export EDITOR="$VISUAL"
alias vim=nvim

# Fixing an issue I've encountered with homebrew.
export HOMEBREW_NO_GITHUB_API=1

# Convert utf-8 to ascii.
function ascii()
{
    iconv -f UTF-8 -t ascii $1 > $1.tmp
    rm $1
    mv $1.tmp $1
}

# Convert plain-text to pdf (MacOS)
function pdf () {
	cupsfilter $1 > "${1%.*}.pdf" 2> /dev/null
}

# Go?
export GOPATH="$HOME/go"

# Honestly not sure what this does, but it's probably here for a reason.
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

