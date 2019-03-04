#!/bin/sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install dotfiles
dotfiles=(gitconfig vimrc zshenv zshrc)
path=`pwd`

for dotfile in ${dotfiles[@]}
do
  home_dotfile="$HOME/.$dotfile"

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

# install vundle plugins
vundle

# source updated .zshrc
exec zsh -l

# install fonts
brew tap caskroom/fonts
brew cask install font-fira-code
