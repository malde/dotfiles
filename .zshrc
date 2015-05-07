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

export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/sbin:/sbin
export PATH=$PATH:/Users/malte/dev/_tools/apache-ant-1.8.3/bin
export PATH=$PATH:/Users/malte/dev/_tools/android-sdk-macosx
export JAVA_6_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export JAVA_7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home    
export JAVA_HOME=$JAVA_7_HOME
export ANT_HOME=/Users/malte/dev/_tools/apache-ant-1.8.3
export MAVEN_OPTS="-Xms512m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=512m -Dfile.encoding=UTF-8"
export M2_HOME="/usr/local/Cellar/maven32/3.2.5/libexec"
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LANG=en_US.UTF-8
export EDITOR='vi'

bindkey "^[[3~" delete-char

launchctl setenv M2_HOME $M2_HOME

alias la="ls -la"
alias ll="ls -l"

alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# editor aliases
alias vi="vim"
alias nano="vim"

# homebrew
alias brewup='brew update && brew outdated'

# java home switcher
alias java6="export JAVA_HOME=$JAVA_6_HOME"
alias java7="export JAVA_HOME=$JAVA_7_HOME"
alias java8="export JAVA_HOME=$JAVA_8_HOME"

# simple HTTP server in current folder
alias servethis="python -m SimpleHTTPServer"

# clean apple download history
alias cleanup="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# getting rid of duplicates in the Open With submenu
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'
