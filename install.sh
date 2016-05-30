#! /usr/bin/bash
# Auth: Josh Wilson
# Desc: Install script for associated syntax checker tools 

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
START_DIR="$(pwd)"

cd ~
echo "$(pwd)"

##############################################################################
function symlink_vimrc () {
  rm -rfv ~/.vim
  rm -rfv ~/.vimrc
  ln -sfv $SCRIPT_DIR/.vimrc ~/.vimrc  
  ln -sfv $SCRIPT_DIR/.vim ~/.vim
  ls -laFG ~ | grep -E "\->" | grep -E "\.vim"
}

##############################################################################
function build_vim () {
  echo -e "Install VIM from Source"
  sudo rm -rfv vim/
  git clone git@github.com:vim/vim.git vim/
  cd vim/src
  echo "$(pwd)"
  ./configure --prefix=/usr/local/ \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-features=huge
  sudo make; sudo make install
  cd $SCRIPT_DIR
  echo "$(pwd)"
}

##############################################################################
#HomeBrew
brew install cmake npm --upgrade

##############################################################################
#Python

##############################################################################
#Ruby
sudo gem install rubocop

##############################################################################
#JavaScript
npm install -g \
  jshint \
  jscs \
  eslint \
  express-generator \
  mocha

##############################################################################
# Vundle
function vim_plugins () {
  # Check if Vundle is already installed
  if [ ! -d ".vim/bundle/Vundle.vim/.git" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
  fi
  # Install Plugins
  vim +PluginInstall +qall

  # Build Autocomplete
  cd .vim/bundle/YouCompleteMe
  ./install.py --tern-completer 
  cd $SCRIPT_DIR
  echo "$(pwd)"
}
