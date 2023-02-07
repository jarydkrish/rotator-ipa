#!/usr/bin/env bash

echo "Installing the right node version"
cat .node-version | nvm install

echo "Installing Ruby dependencies"
bundle install

echo "Installing JS dependencies"
yarn install

echo "Done! You may want to setup your database"
