#!/bin/bash

echo "📁 Reading local settings..."
rm -f /tmp/brew-sync.*
brew tap > /tmp/brew-sync.taps
brew list > /tmp/brew-sync.installed

echo "📁 Reading dotfiles' settings..."
[ -e $DOTFILES/Homebrew/brew-sync.taps ] && cat $DOTFILES/Homebrew/brew-sync.taps >> /tmp/brew-sync.taps
[ -e $DOTFILES/Homebrew/brew-sync.installed ] && cat $DOTFILES/Homebrew/brew-sync.installed >> /tmp/brew-sync.installed

echo "♻️  Syncing..."
cat /tmp/brew-sync.taps | sort | uniq > $DOTFILES/Homebrew/brew-sync.taps
cat /tmp/brew-sync.installed | sort | uniq > $DOTFILES/Homebrew/brew-sync.installed

echo "✅ DONE"
