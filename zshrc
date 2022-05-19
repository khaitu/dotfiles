# export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('mvim')

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="avit"

# Config
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(colored-man-pages colorize docker fasd git heroku vundle fzf zsh-nvm)

# Disable shared history
unsetopt share_history

# Prompt segments (from agnoster)
CURRENT_BG='NONE'
SEGMENT_SEPARATOR="\ue0b0"
BRANCH="\ue0a0"

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    print -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    print -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && print -n $3
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    print -n "%{%k%}"
  fi
  print -n "%{%f%}"
  CURRENT_BG=''
}

git_prompt() {
  ref=$(git symbolic-ref HEAD  2> /dev/null | cut -d'/' -f3,4,5,6)

  if [ ! -z "$ref" ]; then
    # echo " [\e[0;32m$ref\e[0m]"
    prompt_segment blue black " $BRANCH $ref "
  elif [ -d .git ]; then
    prompt_segment blue black " $BRANCH "
  fi
}

path_prompt() {
  prompt_segment yellow black ' %. '
}

full_prompt() {
  RETVAL=$?
  path_prompt
  git_prompt
  prompt_end
}

# Set prompt
setopt prompt_subst

# Enable ssh keychain
#ssh-add -K 2> /dev/null

# Disable flow control for vim ctrl-s
stty -ixon

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Disable shared history
unsetopt share_history

# Disable correction
unsetopt correct_all

# Override oh-my-zsh prompty
export PS1=$'$(full_prompt) '

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# RVM support
source ~/.rvm/scripts/rvm

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

RPROMPT=


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

eval "$(starship init zsh)"
