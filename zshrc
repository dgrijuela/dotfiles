ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dgrijuela"

COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh
plugins=(git bundler brew gem)

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

export PATH="/home/kln2d/.rvm/gems/ruby-2.1.5/bin:/home/kln2d/.rvm/gems/ruby-2.1.5@global/bin:/home/kln2d/.rvm/rubies/ruby-2.1.5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/kln2d/.rvm/bin:/home/kln2d/.rvm/bin"
