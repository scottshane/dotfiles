# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="fishy"

# Example aliases
alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

PROJECT_PATHS=(~/Projects)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format:
# plugins=(rails git textmate ruby lighthouse)
plugins=(git osx pj)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Java / Maven shit
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_17.jdk/Contents/Home/jre/
export M2_HOME=/usr/local/apache-maven/apache-maven-3.1.1
export M2=$M2_HOME/bin

export PATH=$M2:$JAVA_HOME/bin:$PATH

export LESSEDIT='subl %f'

export PATH=$HOME/local/bin:$PATH
export PATH=${HOME}/local/ExuberantCtags/bin/ctags:$PATH
export PATH=/usr/local/git/libexec/git-core:$PATH
export PATH=/usr/local/heroku/bin:$PATH

export PATH=/usr/local/tidy5/bin:$PATH

#export PATH=/Applications/MAMP/Library/bin:$PATH
export PATH=$HOME/local/redis/src:$PATH
export PATH=$HOME/local/mongoDB/bin:$PATH
export PATH=$HOME/local/mecurial/bin:$PATH

export PATH=$HOME/local/autoconf/bin:$PATH
export PATH=$HOME/local/automake/bin:$PATH
export PATH=$HOME/local/watchman/bin:$PATH

export PATH=$HOME/local/s3cmd:$PATH

export PATH=$HOME/local/pygments/bin:$PATH
export PATH=$PATH:$HOME/local/android/tools
export PATH=$PATH:$HOME/local/android/platform-tools

export PATH=$PATH:$HOME/local/bin/CMake.app/Contents/bin

export PATH=$PATH:$HOME/local/lessc-map/bin

export PATH=$HOME/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

if [ $TERM == 'dumb' ]; then 
    export PS1="→ "
        echo 'special setup for MacVim'
fi
