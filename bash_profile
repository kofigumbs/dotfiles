eval "$(/opt/homebrew/bin/brew shellenv)"

source $HOME/.bashrc

source_if_exists $HOME/.secrets.env
source_if_exists $HOME/.cargo/env
source_if_exists $HOME/.asdf/asdf.sh
