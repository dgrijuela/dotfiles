# Git bash integration
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# Aliases

## GIT
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

## General goodies
alias ls='ls -G'
alias emacs="open /Applications/Emacs.app"
alias grep='grep --color'
alias tunnel='sshuttle -D --pidfile=/tmp/sshuttle.pid --dns 0/0 -r'
alias stoptunnel='[[ -f /tmp/sshuttle.pid ]] && kill `cat /tmp/sshuttle.pid`'
alias map="xargs -n1"
alias password="ruby -e 'require \"securerandom\";puts SecureRandom.base64[0...-2]'"
alias clj='rlwrap clj'
alias sbcl='rlwrap /usr/local/bin/sbcl'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias post="curl -i -X POST"
alias get="curl -i -X GET"
alias put="curl -i -X PUT"

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\033[33m\]\u\[\033[00m\]@\[\033[32m\]\h\[\033[00m\]:\[\033[34m\]\w\[\033[35m\]$(parse_git_branch)\[\033[00m\]\$ '

set show-all-if-ambiguous on
set completion-ignore-case on

# ENV Configuration
export EDITOR='vim'

# Paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
