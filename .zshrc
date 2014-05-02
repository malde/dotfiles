# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jreese"

# Example aliases
alias zshconfig="mate ~/.zshrc"
alias zshsource="source ~/.zshrc"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow git-extras mvn brew terminalapp colored-man zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...

export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/sbin:/sbin
export PATH=$PATH:/Users/malte/dev/_tools/apache-ant-1.8.3/bin
export PATH=$PATH:/Users/malte/dev/_tools/android-sdk-macosx
export JAVA_6_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export JAVA_7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export JAVA_HOME=$JAVA_7_HOME
export ANT_HOME=/Users/malte/dev/_tools/apache-ant-1.8.3
export MAVEN_OPTS="-Xms512m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=512m -Dfile.encoding=UTF-8"
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LANG=en_US.UTF-8
export EDITOR='vi'

bindkey "^[[3~" delete-char

alias la="ls -la"
alias ll="ls -l"

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

# simple HTTP server in current folder
alias servethis="python -m SimpleHTTPServer"

# clean apple download history
alias cleanup="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# getting rid of duplicates in the Open With submenu
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'
