#!/bin/bash
# depends on brew.sh - to install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp ~/.zshrc ~/.zshrc.orig
cp zshrc_tim ~/.zshrc
chsh -s /bin/zsh

