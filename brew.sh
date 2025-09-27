#!/bin/bash

# Brew formulas to install

checkexec() {
  if [[ $? != 0 ]] ; then
    echo "Non-zero return code"
    echo "Please check the last formula was installed correctly"
    exit 1
  fi
}
# zsh
brew install zsh
checkexec
brew install git
checkexec
# wget
brew install wget
checkexec
# sipcalc
brew install sipcalc
checkexec
# tree
brew install tree
checkexec
# pyenv
brew install pyenv
checkexec
brew install macvim
checkexec
brew install miniforge
checkexec
# node
brew install node
checkexec
# github cli
brew install gh
checkexec