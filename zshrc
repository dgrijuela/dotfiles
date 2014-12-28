ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dgrijuela"

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh
plugins=(git bundler brew gem)

# Aliases

## General
alias cp="cp -iv" # v is for verbose, i is to ask confirmation to override
alias rm="rm -iv"
alias mv="mv -iv"
alias ls="ls -Fgh" # f is for file types, g to colorize, h to follow symbolic linkks
alias la="ls -al" # same with hidden files

## Git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gru='git remote update'
alias gpu='git pull'
alias gcl='git clone'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gpp='git pull --rebase && git push'
alias gmf='git merge --ff-only'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

## Vagrant
alias vag='vagrant'
alias vagup='vagrant up'
alias vagdestroy='vagrant destroy'
alias vagssh='vagrant ssh'
alias vaghalt='vagrant halt'

## Curl
alias post="curl -i -X POST"
alias get="curl -i -X GET"
alias put="curl -i -X PUT"

## Databases (future)
# alias mongo.start='ulimit -Sn 1024; mongod --config /usr/local/etc/mongod.conf'
# alias mongo.stop='kill $(cat /usr/local/var/run/mongod.pid) && rm /usr/local/var/run/mongod.pid'
# alias pg.start='pg_ctl start -D /usr/local/var/db/postgresql -l /usr/local/var/log/postgres.log'
# alias pg.stop='pg_ctl stop -D /usr/local/var/db/postgresql'
# alias pg.status='pg_ctl status -D /usr/local/var/db/postgresql'
# alias redis.start='redis-server /usr/local/etc/redis.conf'
# alias redis.stop='kill $(cat /usr/local/var/run/redis.pid)'

# Functions

## Find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

## Serve current directory
serve() {
  port="${1:-3000}"
  echo "Serving on http://localhost:$port"
  echo "\n\n"
  ruby -run -e httpd . -p $port
}

# Use vim as editor if present
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

# Load RVM into a shell session *as a function* if present
if [ -f $HOME/.rvm/scripts/rvm ]; then
  source $HOME/.rvm/scripts/rvm
fi

# Read .profile if present
if [ -f $HOME/.profile ]; then
  source $HOME/.profile
fi

export PATH="/home/kln2d/.rvm/gems/ruby-2.1.5/bin:/home/kln2d/.rvm/gems/ruby-2.1.5@global/bin:/home/kln2d/.rvm/rubies/ruby-2.1.5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/kln2d/.rvm/bin:/home/kln2d/.rvm/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
