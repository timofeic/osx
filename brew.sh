#!/bin/bash

# Brew formulas to install

checkexec() {
  if [[ $? != 0 ]] ; then
    echo "Non-zero return code"
    echo "Please check the last formula was installed correctly"
    exit 1
  fi
}
brew install zsh
checkexec
brew install git
checkexec
brew install wget
checkexec
brew install sipcalc
checkexec
brew install tree
checkexec
brew install pyenv
checkexec
brew install macvim
checkexec
brew install miniforge
checkexec
brew install node
checkexec