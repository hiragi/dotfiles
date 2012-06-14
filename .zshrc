# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# # End of lines configured by zsh-newuser-install
# # The following lines were added by compinstall
zstyle :compinstall filename '/home/hiragi/.zshrc'
#
autoload -Uz compinit
compinit
# # End of lines added by compinstall
#
# added

if [ $SHLVL = 1 ]; then
	byobu
fi

alias ll="ls-l"
alias la="ls -a"
alias em="emacs"


setopt correct
setopt autocd
setopt auto_pushd
setopt list_packed
setopt nobeep

# ヒストリにhistoryコマンドを記録しない
setopt hist_no_store

# 余分なスペースを削除してヒストリに記録する
setopt hist_reduce_blanks

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# Ctrl+wで､直前の/までを削除する｡
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ディレクトリを水色に
export LS_COLORS='di=01;36'

# cdしたらlsする。
function chpwd() { ls }
