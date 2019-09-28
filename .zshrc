# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/elec/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set zsh autosuggestions path
source /usr/share/zsh/site-contrib/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set zsh syntax highlighting path
source /usr/share/zsh/site-contrib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Jump around with z
#source ~/Git/z/z.sh

# Source the dotfiles shortcut function
#source ~/Git/Electrux/Gentoo-Dots/Customization/scripts/editdots.sh

# Make output of less command colorized.
# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
#export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green

# Set ls_extended as the ls command
alias ls='ls_extended -sn'
alias l='ls_extended -lAhns'

# Set rsync as the copy command
alias cp='rsync -ah --info=progress2'
# Don't preserve permissions
alias scpna='sudo rsync -h --info=progress2'

# Set neovim as vim
alias vim="/usr/bin/nvim"

# Copy & Paste
alias copy="xclip -sel clipboard"
alias paste="xclip -sel clipboard -o 2>/dev/null"

echo ''
neofetch
