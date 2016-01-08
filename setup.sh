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
