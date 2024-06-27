# Function to attach to the last tmux session or create a new one
tmux_auto_start() {
  if command -v tmux &> /dev/null; then
    if [ -z "$TMUX" ]; then
      if tmux ls 2>/dev/null | grep -q '^'; then
        # Attach to the last session if it exists
        tmux attach-session -t "$(tmux ls | grep -o '^[^:]*' | tail -n1)"
      else
        # Create a new session if no sessions exist
        tmux new-session -s default
      fi
    fi
  fi
}

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

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"

# make "less" better
# X = leave content on-screen
# F = quit automatically if less than one screenfull
# R = raw terminal characters (fixes git diff)
#     see http://jugglingbits.wordpress.com/2010/03/24/a-better-less-playing-nice-with-git/
export LESS="-F -X -R"

# Rust
export CARGO_TARGET_DIR="${HOME}/.cargo/target"
export CARGO_INCREMENTAL=1
export RUST_BACKTRACE=1

# Python
PYTHONPYCACHEPREFIX="${HOME}/.cache/pycache"

source "${HOME}/.oh-my-zsh/oh-my-zsh.sh"
source "${HOME}/.p10k.zsh"
source "${HOME}/.aliases"
[[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:$PATH"
if type -p zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

export TZ="Asia/Jerusalem"
export EDITOR=nano
export GPG_TTY=$(tty)
