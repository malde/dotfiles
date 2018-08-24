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

alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# editor aliases
alias vi="vim"
alias nano="vim"

# because I can't type
alias gut="git"

# node version manager stuff
export NVM_DIR="/Users/malte/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# homebrew (cask) update function
brewup() {
    brew update &&
    { echo '' } &&
    { echo outdated brews: } &&
    brew outdated &&
    { echo '' } &&
    { echo outdated casks: } &&
    brew cask outdated &&
    { echo '' } &&
    { echo update brews or casks with brew upgrade AND/OR brew cask upgrade }
}

# simple HTTP server in current folder
alias servethis="python -m SimpleHTTPServer"

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
