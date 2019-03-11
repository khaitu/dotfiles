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
plugins=(bundler colored-man-pages colorize docker fasd git heroku nvm vundle)

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
ssh-add -K 2> /dev/null

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Override oh-my-zsh prompty
export PS1=$'$(full_prompt) '

RPROMPT=

