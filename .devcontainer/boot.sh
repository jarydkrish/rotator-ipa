#!/bin/bash -i

# This script is run inside the container after the repo has been cloned.

# Install the correct version of node
echo "Installing NodeJS"
source $NVM_DIR/nvm.sh && nvm install $(cat .node-version)

# Install ruby deps
echo "Installing Ruby deps"
gem install bundler
bundle install

# Install node deps
echo "Installing Node deps"
yarn install

echo "Done!"
