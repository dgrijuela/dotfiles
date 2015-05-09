ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dgrijuela"

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color

source $ZSH/oh-my-zsh.sh
plugins=(git bundler brew gem)

# Aliases

## General
alias v="vim"
alias e="emacs -nw"
alias t='tmux'
alias cp="cp -iv" # v is for verbose, i is to ask confirmation to override
alias mv="mv -iv"
alias ls="ls -Fgh" # f is for file types, g to colorize, h to follow symbolic linkks
alias la="ls -al" # same with hidden files
alias google-chrome="/usr/bin/open -a '/Applications/Google Chrome.app/'"
alias chrome='google-chrome'

## Git aliases
alias ga='git add'
alias gp='git push'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gs='git status -sb'
alias gd='git diff --color-words'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gmn='git commit --amend --no-edit'
alias gme='git merge'
alias gb='git branch -a'
alias gc='git checkout'
alias gt='git tag -l'
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

## Private
source ~/.private_aliases

# Quickly find files that contain a string in a directory
qfind() {
  find . -exec grep -l -s $1 {} \;
  return 0
}

# Serve current directory
serve() {
  port="${1:-3000}"
  echo "Serving on http://localhost:$port"
  echo "\n\n"
  ruby -run -e httpd . -p $port
}

# Change file extensions recursively in current directory
# $ change-extension erb haml
change-extension() {
  foreach f (**/*.$1)
    mv $f $f:r.$2
  end
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

# Source nvm
. ~/.nvm/nvm.sh

export NVM_DIR="/Users/dgrijuela/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin:/usr/local/go/bin"
