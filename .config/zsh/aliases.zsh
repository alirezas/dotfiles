# Shortcuts
alias brewsync="sh $DOTFILES/Homebrew/sync.sh"
alias vscodeextensionslist="code --list-extensions > $DOTFILES/vscode-extensions.md"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Directories
alias dotfiles="cd $DOTFILES"
alias dev="cd $HOME/dev"


# Laravel
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias tinker="php artisan tinker"
alias seed="php artisan db:seed"
alias serve="php artisan serve"

# Valet
alias vp="valet php"
alias va="valet php artisan"
alias vc="valet composer"

# NeoVim
# alias vim="nvim"
