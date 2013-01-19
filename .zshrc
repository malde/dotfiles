# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jreese"

# Example aliases
alias zshconfig="nano ~/.zshrc"
alias zshsource="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras mvn brew terminalapp)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=$PATH:/Users/malte/dev/_tools/apache-ant-1.8.3/bin
export PATH=$PATH:/Users/malte/dev/_tools/android-sdk-macosx/tools
export PATH=$PATH:/Users/malte/dev/_tools/sencha-touch-2.0.0-commercial/command
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_09.jdk/Contents/Home
export ANT_HOME=/Users/malte/dev/_tools/apache-ant-1.8.3
export MAVEN_HOME=/Users/malte/dev/_tools/apache-maven-3.0.3
export M2_HOME=/Users/malte/dev/_tools/apache-maven-3.0.3
export MAVEN_OPTS="-Xms512m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=512m -Dfile.encoding=UTF-8"
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LANG=en_US.UTF-8

bindkey "^[[3~" delete-char

alias la="ls -la"
alias ll="ls -l"

# simple HTTP server in current folder
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
