# Load dotfiles binaries
export PATH="$DOTFILES/bin:$PATH"

export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

export PATH="/Users/Shared/DBngin/postgresql/15.1/bin:$PATH"

# Fig path
# export PATH="$HOME/.fig/bin:$PATH"

# Load Composer tools
# export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
# export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
# export PATH="node_modules/.bin:vendor/bin:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
