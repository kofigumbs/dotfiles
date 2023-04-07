case $- in
    *i*) ;; # only execute file when shell is interactive
      *) return;;
esac

HISTCONTROL=ignoreboth # ignore duplicate lines and lines starting with space
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend # append to the history file instaed of overwriting it
shopt -s checkwinsize # update window size after each command
shopt -s extglob
stty -ixon

source_if_exists() { [ -f $1 ] && . $1; }
source_if_exists $HOME/.asdf/completions/asdf.bash
source_if_exists /usr/local/etc/bash_completion

export VISUAL="nvim"
export EDITOR="nvim"
export BASH_SILENCE_DEPRECATION_WARNING=1 # ignore macOS deprecation
export PS1='\n\[\e[1m\]\w$(__git_ps1)$(__aws_vault)\n$ \[\e[0m\]'

export KBDEBUG_USER=kgumbs
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH:~/.local/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

alias tmp='pushd $(mktemp -d)'
alias ll='ls -AFGgohl'

screenshot() {
  URL="$1"

  if [[ -z "$URL" ]]
  then
      echo "Take a screenshot with Google Chrome. Default size is 1024x1024."
      echo ""
      echo "USAGE:"
      echo "  screenshot PATH|URL [SIZE]"
      echo ""
      return 1
  fi

  if [[ "$URL" != http* ]]
  then
      URL="file://`realpath $URL`"
  fi

  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
      --headless \
      --default-background-color=00000000 \
      --window-size="${2:-1024x1024}" \
      --screenshot="$HOME/Desktop/`date +"%Y-%m-%dT%H:%M:%S"`.png" \
      "$URL"
}

__aws_vault() {
  if [ ! -z "$AWS_VAULT" ]
  then
    printf -- " [$AWS_VAULT]"
  fi
}
