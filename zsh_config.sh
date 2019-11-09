#!/bin/bash
# depends on brew.sh - to install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp zshrc_tim ~/.zshrc
chsh -s /bin/zsh

