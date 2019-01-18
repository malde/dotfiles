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

export TERM=xterm-256color
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/sbin:/sbin
export PATH=$PATH:/Users/malte/Applications/SenchaCmd
export MAVEN_OPTS="-Xms512m -Xmx2048m -Dfile.encoding=UTF-8"
export M3_HOME="/Users/malte/dev/_tools/maven_brew"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='vi'

bindkey "^[[3~" delete-char

launchctl setenv M2_HOME $M3_HOME
launchctl setenv M3_HOME $M3_HOME

alias la="ls -la"
alias ll="ls -l"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias dc="docker-compose"

# editor aliases
alias vi="vim"
alias nano="vim"

# because I can't type
alias gut="git"

# some improved default commands
alias ping="prettyping --nolegend"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help="tldr"

# node version manager stuff
export NVM_DIR="/Users/malte/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# homebrew (cask) update function
brewup() {
    brew update &&
    { echo '\noutdated brews:' } &&
    brew outdated &&
    { echo '\noutdated casks:' } &&
    brew cask outdated &&
    { echo '\nupdate brews or casks with brew upgrade AND/OR brew cask upgrade' }
}
# homebrew command not found
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
# homebrew options
export HOMEBREW_INSTALL_CLEANUP=1

# start Chrome without cert-checks
alias devchrome="open -a Google\ Chrome --args --ignore-certificate-errors --user-data-dir"

# clean apple download history
alias cleanup="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# getting rid of duplicates in the Open With submenu
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'
