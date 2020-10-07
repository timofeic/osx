#!/bin/bash
cd ~
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
python3 -m pip install --upgrade pip setuptools wheel virtualenv
virtualenv -p /usr/local/bin/python3.8 python
