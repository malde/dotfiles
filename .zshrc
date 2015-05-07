#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Disable autocorrect guesses. Happens when typing a wrong
# command that may look like an existing one.
unsetopt CORRECT

# This bunch of code displays red dots when autocompleting
# a command with the tab key, "Oh-my-zsh"-style.                      
expand-or-complete-with-dots() {     
  echo -n "\e[31m......\e[0m"         
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Customize to your needs...

export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LANG=en_US.UTF-8
export EDITOR='vi'

bindkey "^[[3~" delete-char

alias la="ls -la"
alias ll="ls -l"

alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# editor aliases
alias vi="vim"
alias nano="vim"

# simple HTTP server in current folder
alias servethis="python -m SimpleHTTPServer"
