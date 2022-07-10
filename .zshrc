# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export ZSH="/home/jamesupjohn/.oh-my-zsh"

ZSH_THEME="essembeh"

plugins=(dotnet)

source $ZSH/oh-my-zsh.sh

# Fixes some weird Java windowing issues with apps such as IntelliJ/Rider
export _JAVA_AWT_WM_NONREPARENTING=1

# I really don't want to send telemetry data to MS from my home PC
# They have my CI runners, that's enough
export DOTNET_CLI_TELEMETRY_OPTOUT=0
export EDITOR=nvim

bindkey -v
bindkey '^R' history-incremental-pattern-search-backward


# User aliases

# Just created a tmp directory and changes into it, all in one!
alias tmpme='cd `mktemp -d`'

# Gotta be a better workaround for this
alias ssh='TERM=xterm ssh'

# Removes orphaned pacman packages
alias pacman-rmorphans='sudo pacman -Qtdq | sudo pacman -Rns -'

# Creates a fresh c2 instance for dev testing
alias c2-clean='XDG_DATA_HOME=$(mktemp -d) ~/Development/c2/cmake-build-debug/bin/chatterino'

# I'm lazy, it's nice to just type 'ef' when doing entity framework stuff
alias ef="dotnet dotnet-ef"

# .dotfiles is a bare repo
alias git-dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


bindkey "^W" edit-command-line

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/nvm/init-nvm.sh


# dotnet CLI autocompletion
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")
  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
