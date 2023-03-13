#!/bin/bash

echo "Docs: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
echo "Installing awscli v2"

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
echo "AWS cli installed in this directory:"
which aws
echo "AWS Version installed"
aws --version
