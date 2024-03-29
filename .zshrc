#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# zsh-autosuggestions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
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
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:/usr/sbin:/sbin"
export PATH="$PATH:/Users/malte/Applications/SenchaCmd"
export PATH="$PATH:$HOME/.krew/bin"
export MAVEN_OPTS="-Xms512m -Xmx2048m -Dfile.encoding=UTF-8"
export JAVA_HOME=`/usr/libexec/java_home -v 18`
export QMK_HOME="/Users/malte/dev/keeb/qmk_firmware"
export CLICOLOR=1
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='vi'
# ruby stuff
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init -)"

bindkey "^[[3~" delete-char

alias la="ls -la"
alias ll="ls -l"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# dev tools
alias g="git"
alias dc="docker compose"
alias d="docker"
alias k="kubectl"
alias p="pnpm"
alias m="mvn"

# editor aliases
alias vi="vim"
alias nano="vim"

# because I can't type
alias gut="git"

alias grep='grep --color=auto'

# maven via mvnvm
export MVN_VERSION=3.8.5
alias mvn="mvn --mvn-version $MVN_VERSION"
alias mvnDebug="mvnDebug --mvn-version $MVN_VERSION"

# jdk switcher
alias jdk8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`"
alias jdk11="export JAVA_HOME=`/usr/libexec/java_home -v 11`"
alias jdk17="export JAVA_HOME=`/usr/libexec/java_home -v 17`"

# gimmicks
alias serve="python3 -m http.server"

# coreutils
alias readlink="greadlink"

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

alias brewup="brew upgrade"
# homebrew command not found
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
# homebrew options
export HOMEBREW_INSTALL_CLEANUP=1

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubernetes autocompletion
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
