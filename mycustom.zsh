# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

autoload -Uz zmv
alias zmv='noglob zmv -W'

unsetopt correct_all

alias ssh-to-estimate="ssh deployer@estimate.mitsu-ri.net"
alias ssh-to-jenkins="ssh ec2-user@54.238.93.229"
alias ssh-to-metabase="ssh ubuntu@metabase.mitsu-ri.net"
alias ssh-to-cloudbeaver="ssh ubuntu@cloudbeaver.mitsu-ri.net"
alias ssh-to-mitsuri="ssh ubuntu@mitsu-ri.net"
alias ssh-to-catallaxy="ssh deployer@catallaxy.me"
alias ssh-to-fabit="ssh deployer@fa-bit.net"
alias g="googler -n 10"
alias diff="diff -ybBw"
alias ssh-moyashi='ssh deployer@saiyasu-syuuri.com'
alias ssh-breeder-one='ssh deployer@breeder-one.jp'
alias fuck='sudo $(fc -ln -1)'
alias llt='ll -t'
alias dm="docker-machine"
alias dc="docker-compose"
alias untar='tar zxvf'
alias emacs='emacs26 -nw'
alias change_mode='chmod'
alias change_owner='chown'
#alias sudo='sudo '
alias em=emacs26
alias c=cursor
alias move=mv
alias remove=rm
alias reload='source ~/.zshrc'
#alias e='emacsclient -n'
alias ll='ls -lh'
alias la='ls -a'
alias open='xdg-open'
alias branches='git branch'
alias rebase='git rebase'
alias cherry_pick='git cherry-pick'
alias grm='git rm'
alias back='git checkout -'
alias pull='git pull'
alias timeline="git log -10 --format=format:'%Cgreen%h %Creset• %s (%cN, %ar)'"
alias branchout="git checkout -b"
alias pull_this_branch='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias remove_branch="git branch rm"
alias stage='git add'
alias push='git push'
alias push_heroku='git push heroku master'
alias create_pull_request='COMMIT_LOG=$(git log -1 --pretty=%B); TITLE=$(echo "$COMMIT_LOG" | head -n 1); BODY=$(echo "$COMMIT_LOG" | awk "NR==2"); gh pr create --title "$TITLE" --body "$BODY"'
alias open_pull_request='gh pr view -w'
alias push_this_branch='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias push_heroku='git push heroku `git rev-parse --abbrev-ref HEAD`'
alias stage_commit_push='git add . && git commit -am "modified" && push_this_branch'
alias stage_commit_push_deploy='git add . && git commit -am "modified" && push_this_branch && bundle exec cap production deploy'
alias amend_commit_log='git commit --amend'
alias checkout='git checkout'
worktreeout() {
    local branch_name=$1
    local current_dir=$(basename "$PWD")
    local worktree_path="../${current_dir}-${branch_name}"
    git worktree add "$worktree_path" "$branch_name" 2>/dev/null || git worktree add "$worktree_path" -b "$branch_name"
    cd "$worktree_path"
}
alias status='git status'
alias commit='git commit -m'
alias empty_commit="git commit -m 'empty commit' --allow-empty"
alias empty_commit_push="empty_commit && push_this_branch && bundle exec cap deploy production"
alias uncommit='git reset --mixed HEAD~'
alias unstage='git reset -q HEAD --'
alias nevermind='git reset --hard HEAD && git clean -d -f'
alias clean='git clean -f'
alias revert='git revert'
alias stage_commit='git add . && git commit -am'
alias gdiff='git diff --color'
alias amend='git commit --amend'
alias merge='git merge --no-ff'
alias gflow='git flow'
alias init='git init'
alias logs='git log'
alias remote='git remote'
alias stash='git stash'
alias unstash='git stash pop'
alias what='git show -w'
alias prestage="git diff -w --word-diff=color"
alias precommit="git diff --cached -w --word-diff=color --word-diff-regex='[^[:space:]<>]+'"
alias update_master='git checkout master; git fetch origin master; git rebase origin/master';
alias fetch='git fetch'
alias gtag='git tag'
alias gtag_now='git tag `date +%y.%m.%d.%H.%M`'
alias psg='ps aux | grep'
alias killp='kill -9'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head -n'
alias -g T='| tail -n'
alias -g C='| xclip'
alias -g DN='> /dev/null 2>&1'
alias processes='ps aux'
alias paste='xclip -o'
alias memo='e ~/memo.txt'
alias todo='e ~/todo.txt'
alias note='e ~/note.txt'
alias misawa_aseri='echo "![misawa](http://livedoor.blogimg.jp/sonisoku/imgs/d/d/ddfa8bd7.jpg)" | xclip'
alias misawa_daijoubu='echo "![misawa](http://livedoor.blogimg.jp/sonisoku/imgs/3/9/3985034b.jpg)" | xclip'
alias misawa_hurdle='echo "![misawa](http://livedoor.blogimg.jp/sonisoku/imgs/c/3/c32229c6.jpg)" | xclip'
alias misawa_no_ok='echo "![misawa](http://livedoor.blogimg.jp/sonisoku/imgs/9/8/9811ac7b.jpg)" | xclip'
alias misawa_ng='echo "![misawa](http://livedoor.blogimg.jp/sonisoku/imgs/1/6/1618eefb.jpg)" | xclip'
alias misawa_tukare='echo "![misawa](http://livedoor.blogimg.jp/sonisoku/imgs/5/1/51c36e50.jpg)" | xclip'
alias misawa_kila='echo "![misawa](http://tadamemo.hp2.jp/wp-content/uploads/2011/07/110702-8.jpg)" | xclip'
alias misawa_arigatou='echo "![misawa](http://stat.ameba.jp/user_images/20111119/20/31041120/a6/ef/g/o0240032011621145820.gif)" | xclip'
alias misawa_sorry='echo "![misawa](http://pic.prepics-cdn.com/alpapi0725/17896453.jpeg)" | xclip'
alias misawa_gozen='echo "![misawa](http://pic.prepics-cdn.com/583effbdd8ab/7470900.jpeg)" | xclip'
alias misawa_shippai='echo "![misawa](http://up.gc-img.net/post_img/2014/02/VFSSUpmJ4pK2oP4_ZdMdV_62.jpeg)" | xclip'
alias misawa_ganbaru='echo "![misawa](http://up.gc-img.net/post_img/2014/02/VFSSUpmJ4pK2oP4_ll8QW_74.jpeg)" | xclip'
alias misawa_gomennasai='echo "![misawa](http://up.gc-img.net/post_img/2014/02/VFSSUpmJ4pK2oP4_pgbiE_85.jpeg)" | xclip'
alias misawa_tsukaenai='echo "![misawa](http://jigokuno.img.jugem.jp/20131105_842042.gif)" | xclip'
alias misawa_dogeza='echo "![misawa](http://up.gc-img.net/post_img_web/2014/02/7345c92b9d0952a4697b83505c281eef_9288.gif)" | xclip'
alias misawa_arigatousagi='echo "![misawa](http://pic.prepics-cdn.com/pib50250106/6783660.gif)" | xclip'
alias tension_agatte_kita='echo "![ichiro](http://pds.exblog.jp/pds/1/200806/01/27/e0099027_23162958.jpg)" | xclip'
alias yatta='echo "![yatta](http://livedoor.blogimg.jp/mstkkt-shingeki/imgs/a/a/aa0039cf.jpg)" | xclip'
alias wakarimasen='echo "![wakarimasen](http://sinngeki-ch.up.n.seesaa.net/sinngeki-ch/image/a59b9b9c086c9a13005710c2a82cd606.jpg?d=a1)" | xclip'
alias yarinaose='echo "![yarinaose](http://mangadget.net/img/comic_image/1362/dbb382f2b2c5969547e9fedadedeb3e6.jpg)" | xclip'
alias toushishiro='echo "![toushishiro](http://livedoor.blogimg.jp/mstkkt-shingeki/imgs/2/d/2d963111.jpg)" | xclip'
alias hashirankai='echo "![hashirankai](http://file.putiparu.blog.shinobi.jp/c5b7f5fb.jpeg)" | xclip'
alias sumimasen='echo "![sumimasen](http://livedoor.sp.blogimg.jp/attack_titan/imgs/3/b/3b6767ac.png)" | xclip'
alias yarushikanai='echo "![yarushikanai](http://mangadget.net/img/comic_image/1476/f7521fa9f40cc7510072f29305ae33b3.jpg)" | xclip'
alias koukaihanai='echo "![koukaihanai](http://mangadget.net/img/comic_image/1396/ec29c94f3319c162a8d2e45eb253fefb.jpg)" | xclip'
alias yaritakyayare='echo "![yaritakyayare](http://mangadget.net/img/comic_image/1405/b6b655198474b7389c72e0f561d1c219.jpg)" | xclip'
alias orenokanda='echo "![orenokanda](http://mangadget.net/img/comic_image/1391/55879da0b213e4579bffa04a81fcfb88.jpg)" | xclip'
alias darenimoiuna='echo "![darenimoiuna](http://mangadget.net/img/comic_image/1270/492548a48e4f4eb7d0cc66f1919e4b7a.jpg)" | xclip'
alias koukishin='echo "![koukishin](http://mangadget.net/img/comic_image/1275/ec1f6135e536ab60a1a0622d4697718b.jpg)" | xclip'
alias lgtm='echo "![lgtm](http://mangadget.net/img/comic_image/1717/237551bd3b178cfbbec4d60bacf66986.jpg)" | xclip'
alias lgtm_good='echo "![lgtm](http://mangadget.net/img/comic_image/182/14622aabd8d7b8bfe37217fee929af91.jpg)" | xclip'
alias kansha='echo "![lgtm](http://blog-imgs-52.fc2.com/e/v/i/evil917/a8ca8a73.jpg)" | xclip'
alias sasuga='echo "![thanks](http://www.geocities.jp/hobby_room_pearl/jump/daiamon/83-10-jojo3-b-2.jpg)" | xclip'
alias tanoshii='echo "✌(’ω’✌ )三✌(’ω’)✌三( ✌’ω’)✌" | xclip'
alias scrot='cd ~/downloads && scrot -s && cd -'
alias good_shingo='echo "[![LGTM](http://www.lgtm.in/p/KDOkAzFWp)](http://www.lgtm.in/i/KDOkAzFWp)" | xclip'
alias yoroshiku='echo "ヾ(◜▿‾ ( ´▿｀ ) ‾▿◝)ﾉ" | xclip'
alias release_bommer="echo http://blog-imgs-63.fc2.com/v/e/r/verdebuster/20140616230743b97.jpg | xclip"
alias komarune='echo "![komaru](http://mangadget.net/img/comic_image/407/aab23398cfcb4a707b2c40afa9bd8601.jpg)" | xclip'
alias mergeok='echo "[![LGTM](http://www.lgtm.in/p/E2dmYQM9q)](http://www.lgtm.in/i/E2dmYQM9q)" | xclip'
alias tenki='weatherget --station-id=JAXX0085 --metric'
alias kk='kill -KILL'
alias kt='kill -TERM'
alias b='bundle'
alias be='bundle exec'
#alias conkeror='/usr/local/xulrunner/xulrunner --app /usr/local/conkeror/application.ini'

mkcd(){
  mkdir $1 && cd $_
}

gsub(){
  find . -type f -print0 | xargs -0 sed -i -e "s/$1/$2/"
}

export PATH=$PATH:/home/hiroaki/app/adt/sdk/platform-tools

# Java
export PATH=$PATH:/usr/local/jdk7/bin:/usr/local/jre7/bin
export PATH=$PATH:/usr/local/java/bin
export PATH=/usr/local/bin/:$PATH

# Cask
export PATH=$PATH:/usr/local/cask/bin

PATH=$PATH:$HOME/Downloads/rvm/bin # Add RVM to PATH for scripting

[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -f $BASH_COMPLETION_DIR/git ]; then
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

#source /usr/local/git/contrib/completion/git-prompt.sh
#source /usr/local/git/contrib/completion/git-completion.bash
#source /usr/local/git/contrib/completion/git-completion.zsh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

PATH=$PATH:/usr/local/phantomjs/bin:/sbin

PATH=$PATH:/usr/local/jruby/bin
PATH=$PATH:/usr/local/gfeedline
PATH=$PATH:/usr/local/mongodb/bin
PATH=$PATH:/$HOME/.shelly/bin

[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh

export AUTOJUMP_KEEP_SYMLINKS=1

export EDITOR=vim
function deploy(){ bundle exec cap $1 deploy}
function mkcd(){ mkdir -p $1 && cd $1}
function rcopy(){ lein exec mywork/clojure/scripts/src/scripts/redmine.clj $1 | xclip }
function pdfpw() { pdftk $1 output 損益計算書_`date +%y%m%d`.pdf user_pw catallaxy@dmin }

bindkey '^s' zaw-history

export PATH=~/bin:$PATH

export PATH=$PATH:/usr/local/xulrunner

export PATH=$PATH:~/mywork/clisp/waf/bin

yd () {
   if [ $# -ne 2 ]; then
     echo "Usage: yd URL name(.mp4)"
     return
   fi
   ruby -e "puts \"$1\".gsub(/&list.*/, '')" | xargs youtube-dl && mv `ruby -e "puts \"$1\".split('?v=')[1]"`.mp4 $2.mp4
}

function dired() {
  emacsclient -e "(dired \"$PWD\")"
}

function cde() {
  EMACS_CWD=`emacsclient -e "
    (expand-file-name
     (with-current-buffer
       (nth 1
         (assoc 'buffer-list
                (nth 1 (nth 1 (current-frame-configuration)))))
         defeault-directory))" | sed 's/^"\(.*\)"$/\1/'`

     echo "chdir to $EMACS_CWD"
     cd "$EMACS_CWD"
}

function mkpassword() {
  len=$1
  [ -z $len ] && len="8"
  char='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
  i=1
  while [ $i -le $len ]; do
    dm=$(( (RANDOM % ${#char}) ))
        str="${str}${char:${dm}:1}"
           i=$(( i+1 ))
            done
            echo "$str"
	}

alias h='history'

function hs
{
  history | grep $*
}

alias hsi='hs -i'
alias e='emacsclient'
alias jo="/usr/local/bin/jo"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gradle='/opt/gradle/gradle-6.3/bin/gradle'
alias clip='xclip -sel clip'

export ANDROID_HOME=/opt/sdk-tools-linux
export PATH=${PATH}:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
export PATH=$PATH:/opt/gradle/gradle-6.2.2/bin
export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:/home/hiroaki/.local/bin
