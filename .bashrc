# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

alias emacs='emacs -nw'
alias em=emacs
alias ll='ls -l'
alias rspec='rspec -cfs'
alias gbranch='git branch'
alias gpull='git pull'
alias gadd='git add'
alias gpush='git push'
alias gco='git checkout'
alias gstatus='git status'
alias gcommit='git commit'
alias gdiff='git diff'
alias gmerge='git merge'
alias gflow='git flow'

init_project(){
  init_dir=`pwd`
  if [ `ls -l | wc -l` -gt 1 ]; then
    echo "the project was already created"
    return -1
  fi
  echo "create project in ${init_dir} (y/n)?"
  read ans
  if [ "$ans" = 'y' ]; then
    touch README.txt
    echo "load 'deploy' if respond_to?(:namespace) # cap2 differentiator" > Capfile
    echo "load 'config/deploy'" >> Capfile
    mkdir -p config/deploy && chmod 755 config
    _create_deploy_rb
    _create_deploy_files
    #mkdir web && chmod 755 web
#    mkdir log && chmod 755 log
#    mkdir tmp && chmod 755 tmp
    mkdir scripts && chmod 755 scripts
    echo -e $CONSTRUCT_PROJECT > scripts/construct.sh
    mkdir etc && chmod 755 etc
    touch etc/httpd_dev.conf
    touch etc/httpd_staging.conf
    touch etc/httpd_prod.conf
    touch etc/my_master_dev.cnf
    touch etc/my_slave_dev.cnf
    touch etc/my_master_staging.cnf
    touch etc/my_slave_staging.cnf
    touch etc/my_master_prod.cnf
    touch etc/my_slave_prod.cnf
    mkdir src && chmod 755 src
    mkdir web && chmod 755 web
    touch web/index.html
  fi
}

_create_deploy_files(){
  deploydir=config/deploy
  files=(dev.rb dev_master.rb dev_slave.rb staging.rb staging_master.rb staging_dev.rb prod.rb prod_master.rb prod_slave.rb)
  for i in "${files[@]}"
  do
    target=$deploydir/$i
    echo "set :branch_name, \"\"" >> $target
    echo "set :repository, \"\"" >> $target
    echo >> $target
    echo "role :app, \"\", \"\"" >> $target
    echo "role :web, \"\", \"\"" >> $target
  done
}

_create_deploy_rb(){
  deploy_rb=config/deploy.rb

  echo "set :application, \"\"" > $deploy_rb
  echo >> $deploy_rb
  echo "set :user, \"\"" >> $deploy_rb
  echo "set :deploy_to, \"/home/#{user}/src/\"" >> $deploy_rb
  echo "set :use_sudo, false" >> $deploy_rb
  echo "set :group_writable, false" >> $deploy_rb
  echo >> $deploy_rb
  echo "set :current_dir, \"CURRENT\"" >> $deploy_rb
  echo >> $deploy_rb
  echo "set :auto_cleanup, true" >> $deploy_rb
  echo >> $deploy_rb
  echo "set :normalize_asset_timestamps, false" >> $deploy_rb
  echo >> $deploy_rb
  echo "require 'capistrano/ext/multistage'" >> $deploy_rb
}

#########################################################################################
# /home/username/etc/httpd.conf -> /home/username/src/CURRENT/etc/httpd_dev.conf
# /home/username/etc/httpd.conf -> /home/username/src/CURRENT/etc/httpd_staging.conf
# /home/username/etc/httpd.conf -> /home/username/src/CURRENT/etc/httpd_prod.conf
# /home/username/etc/my.cnf     -> /home/username/src/CURRENT/etc/my_master_dev.cnf
# /home/username/etc/my.cnf     -> /home/username/src/CURRENT/etc/my_slave_dev.cnf
# /home/username/etc/my.cnf     -> /home/username/src/CURRENT/etc/my_master_staging.cnf
# /home/username/etc/my.cnf     -> /home/username/src/CURRENT/etc/my_slave_staging.cnf
# /home/username/etc/my.cnf     -> /home/username/src/CURRENT/etc/my_master_prod.cnf
# /home/username/etc/my.cnf     -> /home/username/src/CURRENT/etc/my_slave_prod.cnf
#########################################################################################

CONSTRUCT_PROJECT='
construct_project(){\n
    if [ $# -ne 2 ]; then\n
    return -1\n
    fi\n
\n
  echo "You really want to create your conf files in this HOME? /home/`whoami` (y/n)"\n
  read ans\n
  if [ "$ans" = 'y' ]; then\n
\n
        PROJECTNAME=`whoami`\n
        DEV_ENV=$1\n
        DB_ROLE=$2\n
\n
    PROJECTROOT=/home/$PROJECTNAME\n
    mkdir $PROJECTROOT/etc \n
    mkdir $PROJECTROOT/data\n
\n
    if [ "$DEV_ENV" = 'dev' -o "$DEV_ENV" = "staging" -o "$DEV_ENV" = "prod" ]; then\n
          HTTPD_CONF=/home/$PROJECTNAME/src/CURRENT/etc/httpd_${DEV_ENV}.conf\n
          ln -sf $HTTPD_CONF /home/$PROJECTNAME/etc/httpd.conf\n
          sudo ln -sf /home/$PROJECTNAME/etc/httpd.conf /etc/httpd/conf.d/httpd-vhost-$PROJECTNAME.conf\n
    else\n
      return -1\n
    fi\n
\n
    if [ "$DB_ROLE" = 'master' -o "$DB_ROLE" = "slave" ]; then\n
        MY_CNF=/home/$PROJECTNAME/src/CURRENT/etc/my_${DB_ROLE}_${DEV_ENV}.cnf\n
            ln -sf $MY_CNF /home/$PROJECTNAME/etc/my.cnf\n
    else\n
      return -1\n
    fi\n
  fi\n

  ln -sf $PROJECTROOT/src/CURRENT/web $PROJECTROOT/www\n
}\n

construct_project $1 $2
'

if [ $TERM != "screen" ]; then
 screen -e ^z^z
fi

export PATH=$PATH:/Users/user/Documents/platform-tools


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
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

PATH=$PATH:/usr/local/phantomjs/bin:/sbin
