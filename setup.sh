#!/bin/sh

# install yadr if not already installed
if [ ! -d "$HOME/.yadr" ]
then
  sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"
fi

# override yadr/zprezto dotfiles with repository ones
dotfiles=(.gitconfig .zlogin .zlogout .zprofile .zshenv .zshrc .zpreztorc)
path=`pwd`

for dotfile in ${dotfiles[@]}
do
  home_dotfile="$HOME/$dotfile"

  if [ -h $home_dotfile ]
  then
    rm $home_dotfile
  fi

  if [ -f $home_dotfile ]
  then
    mv $home_dotfile "$home_dotfile.backup"
  fi

  ln -s "$path/$dotfile" $home_dotfile
done

# sync visual studio code settings
vscodeconfigs=(keybindings.json settings.json vsicons.settings.json)

for vscodeconfig in ${vscodeconfigs[@]}
do
  local_vscodeconfig="$HOME/Library/Application Support/Code/User/$vscodeconfig"

  if [ -h "$local_vscodeconfig" ]
  then
    rm "$local_vscodeconfig"
  fi

  if [ -f "$local_vscodeconfig" ]
  then
    mv "$local_vscodeconfig" "$local_vscodeconfig.backup"
  fi

  ln -s "$path/.vscode/$vscodeconfig" "$local_vscodeconfig"
done

# sync atom settings
atomconfigs=(config.cson init.coffee keymap.cson packages.cson snippets.cson styles.less)

for atomconfig in ${atomconfigs[@]}
do
  local_atomconfig="$HOME/.atom/$atomconfig"

  if [ -h $local_atomconfig ]
  then
    rm $local_atomconfig
  fi

  if [ -f $local_atomconfig ]
  then
    mv $local_atomconfig "$local_atomconfig.backup"
  fi

  ln -s "$path/.atom/$atomconfig" $local_atomconfig
done

# ensure package sync is installed
apm install package-sync 2&> /dev/null

# source updated .zshrc
exec zsh -l
