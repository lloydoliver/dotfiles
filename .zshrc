# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval `dircolors ~/.dircolors`

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"
DEFAULT_USER="loliver"
prompt_context(){}

HIST_STAMPS="mm/dd/yyyy"

plugins=(
  ansible
  git
  git-prompt
  gpg-agent
  ubuntu
  salt
  vault
  vscode
  systemadmin
  docker
  docker-compose
  gcloud
  kubectl
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Load other dotfiles
dotfiles=(
    "$HOME/.dotfiles/aliases.zsh"
    "$HOME/.dotfiles/envars.zsh"
    "$HOME/.dotfiles/logout.zsh"
    "$HOME/.dotfiles/prompt.zsh"
    "$HOME/.config/dotfiles/bash/vpn"
)

for file in "${dotfiles[@]}"; do
    if [[ -f "${file}" ]]; then
        . "${file}"
    fi
done

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
