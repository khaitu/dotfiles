#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Disable shared history
unsetopt share_history

# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

# Remove RPROMPT
RPROMPT=''

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

# Git branch in prompt.
git_prompt() {
  ref=$(git symbolic-ref HEAD  2> /dev/null | cut -d'/' -f3)
  
  if [ ! -z "$ref" ]; then
    # echo " [\e[0;32m$ref\e[0m]"
    prompt_segment blue white " $BRANCH $ref "
  fi
}

# Path prompt
path_prompt() {
  prompt_segment black white ' %. '
}

# Silly star prompt
star_prompt() {
  prompt_segment white red ' \u2605 '
}

tc_prompt() {
  RETVAL=$?
  path_prompt
  git_prompt
  star_prompt
  prompt_end
}

setopt prompt_subst

# export PS1=$'%.$(git_prompt) \e[1;31m✪ \e[0m'
export PS1=$'$(tc_prompt) '
