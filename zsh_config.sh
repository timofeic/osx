#!/bin/bash
# depends on brew.sh - to install zsh
/bin/bash -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
cp ~/.zshrc ~/.zshrc.orig
cp zshrc_tim ~/.zshrc
chsh -s /bin/zsh

