# Display neofetch if possible but fail silently if not
neofetch 2> /dev/null || true

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
  extract
  gcloud
  genpass
  gh
  git
  git-auto-fetch
  gitignore
  history
  jsontools
  kubectl
  magic-enter
  minikube
  pip
  rust
  sudo
  systemadmin
  systemd
  web-search
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/.zcompdump-$(hostname)-${ZSH_VERSION}"

source "${HOME}/.oh-my-zsh/oh-my-zsh.sh"
source "${HOME}/.p10k.zsh"
[[ -f "${HOME}/.aliases" ]] && source "${HOME}/.aliases"
[[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:$PATH"
if type -p zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

export EDITOR=nano
export GPG_TTY=$(tty)
