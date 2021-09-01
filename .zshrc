# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(git)

# Propmpt
PROMPT="$AWS_PROFILE $ "  
setopt +o nomatch 

## Color Setting
autoload -Uz colors
colors

# Alias
alias load="source ~/.zshrc"
alias fork='/Applications/Fork.app/Contents/MacOS/Fork .'
alias text='/System/Applications/TextEdit.app/Contents/MacOS/TextEdit .'
alias cat=bat
alias ls='exa -l'
alias myip='~/myip.sh'
alias uuid="uuidgen | tr A-Z a-z"

# kubectl completion
source <(kubectl completion zsh)

# kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
KUBE_PS1_SYMBOL_USE_IMG=true

# Rust Configuration
source $HOME/.cargo/env

# direnv
eval "$(direnv hook zsh)"
_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/usr/local/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z ${chpwd_functions[(r)_direnv_hook]} ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

autoload -Uz compinit
compinit

# Anyenv Settings
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"