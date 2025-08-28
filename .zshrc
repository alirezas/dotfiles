eval $(/opt/homebrew/bin/brew shellenv)

# Setup Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install Zinit if it doesn't exist
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Zinit command
ZINIT_CMD=zpl

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load Zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
HIST_STAMPS="yyyy-mm-dd"
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_save_by_copy
setopt hist_verify
setopt hist_ignore_dups
setopt hist_find_no_dups

# cd
setopt autocd
setopt autopushd   # Push the old dir onto the stack when you cd
setopt pushdignoredups  # Don't duplicate entries in the dir stack
setopt pushdsilent # Don’t print directory stack after pushd/popd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Path
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your dotfiles.
export DOTFILES=$HOME/dotfiles


export LDFLAGS="-L /opt/homebrew/lib"
export LDFLAGS="-L /opt/homebrew/lib"

# Load seperated config files
for conf in "$HOME/.config/zsh/"*.zsh; do
  source "${conf}"
done
unset conf


# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/dot/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fzf
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"

# oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/dot.omp.toml)"
fi
