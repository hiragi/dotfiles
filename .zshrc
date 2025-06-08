# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="geoffgarside"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/rufo-0.16.0/lib/rufo.rb

HUBOT_SLACK_TOKEN=xoxb-14624504086-OZgEZXQTdgYw4Q2mzgK6N9fD

source ~/.nvm/nvm.sh
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

export ANDROID_HOME=/home/hiragi/android-sdk-linux
export ANDROID_PLATHOME_TOOLS=/home/hiragi/android-sdk-linux/platform-tools

export PATH=$HOME/.rbenv/bin:$PATH
export MECAB_PATH=/usr/local/lib/libmecab.so.2
export MECAB_PATH=/usr/local/lib/libmecab.so
export PATH=~/.local/bin:$PATH

[[ -s /home/hiroaki/.autojump/etc/profile.d/autojump.sh ]] && source /home/hiroaki/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

export LD_LIBRARY_PATH=/opt/cadexsdk2/lin64/gcc5/lib

export OP_SESSION_catallaxy="oMGY3MUshcFGG_fDfFgoTuGi-HmKWn78bIg0XbA5lAg"
# eval "$(op signin catallaxy)"
source /home/hiroaki/Downloads/zaw/zaw.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export CONSUMER_KEY=823CugcqqjyyPCAaDfSuO3og1
export CONSUMER_SECRET=A6yaV6tRPibGBQlDOL9o5ffU2y4BVSWwfdHAosNMxNcbpJpL4F
export ACCESS_TOKEN=1530841168296038400-EWcrAQoAdeH58bbIqQQm3omTMBghxe
export ACCESS_TOKEN_SECRET=NOyqK8oxaWr5ksIT7p0UCNtN3AOIJ9moADW5QFoOuhQk8
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ -e /home/hiroaki/.nix-profile/etc/profile.d/nix.sh ]; then . /home/hiroaki/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# bun completions
[ -s "/home/hiroaki/.bun/_bun" ] && source "/home/hiroaki/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[[ -s /home/hiroaki/.autojump/etc/profile.d/autojump.sh ]] && source /home/hiroaki/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
