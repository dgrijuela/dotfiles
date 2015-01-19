ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dgrijuela"

COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh
plugins=(git bundler brew gem)

# Aliases

## Git aliases
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
alias gpp='git pull --rebase && git push'
alias gmf='git merge --ff-only'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

## Ruby/Rails aliases
alias rc='rails console'
alias rs='rails server'

## Vagrant aliases
alias vu='vagrant up'
alias vr='vagrant reload --provision'
alias vd='vagrant destroy'
alias vs='vagrant ssh'
alias vh='vagrant halt'

## Curl aliases
alias post="curl -i -X POST"
alias get="curl -i -X GET"
alias put="curl -i -X PUT"

# Quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
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

export PATH="$PATH:$HOME/.rvm/bin"

# Go to code folder by default
cd ~/code
