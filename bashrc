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
source_if_exists $HOME/asdf/completions/asdf.bash
source_if_exists /etc/bash_completion.d/git-prompt
source_if_exists /usr/local/etc/bash_completion
source_if_exists /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source_if_exists /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
source_if_exists /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source_if_exists /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

export PS1='\n\[\e[1m\]\w$(__git_ps1)\n$ \[\e[0m\]'
export PATH="$PATH:~/.local/bin"
export VISUAL="nvim"
export EDITOR="nvim"
export BASH_SILENCE_DEPRECATION_WARNING=1 # ignore macOS deprecation

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
