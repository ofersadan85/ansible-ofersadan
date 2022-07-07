# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
DISABLE_UPDATE_PROMPT="true"

plugins=(
  aws
  command-not-found
  docker
  docker-compose
  dotenv
  extract
  gcloud
  genpass
  git
  git-auto-fetch
  gitignore
  history
  jsontools
  magic-enter
  pip
  sudo
  systemadmin
  systemd
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/.zcompdump-$(hostname)-${ZSH_VERSION}"

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.p10k.zsh

if [[ -d $HOME/.local/bin ]]; then
  export PATH=$HOME/.local/bin:$PATH
fi

alias aptdate="sudo apt update && sudo apt dist-upgrade && sudo apt autoremove && sudo apt autoclean"
