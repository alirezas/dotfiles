#!/bin/sh

echo "Bootstraping new mac..."

# Check for Homebrew
if test ! $(which brew); then
  echo "brew not installed!"
  echo "Installing brew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check for OMZ
# if test ! $(which omz); then
#   echo "omz not installed!"
# fi


# Link zsh config files
ln -sf $HOME/dotfiles/zsh/config.d $HOME/.config/zsh/config.d

# Replace .zshrc from dotfiles
rm -rf $HOME/.zshrc
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc

# Link omz custom directory
rm -rf .oh-my-zsh/custom
ln -sf $HOME/dotfiles/oh-my-zsh/custom $HOME/.oh-my-zsh

# Link default git configs
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig

# Link nvim configs
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim

# Link yabai configs
ln -sf $HOME/dotfiles/yabai $HOME/.config/yabai

# Link skhd configs
ln -sf $HOME/dotfiles/skhd $HOME/.config/skhd

# Link karabiner configs
ln -sf $HOME/dotfiles/karabiner $HOME/.config/karabiner

# Make dev directory
mkdir $HOME/dev
