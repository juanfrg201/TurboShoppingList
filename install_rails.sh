#!/bin/bash
echo "Instalando Ruby on Rails y sus dependencias"

# Instalación de herramientas y dependencias necesarias para Rails
sudo apt-get update
sudo apt-get install -y curl gnupg2 dirmngr

# Instalación de Node.js y Yarn para Rails
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install -y nodejs yarn

echo "gem: --no-document" > ~/.gemrc

gem install bundler

gem install rails -v 7.1.3

# Instalación de Rails
gem install rails "7.1.3"

echo "Rails instalado correctamente."