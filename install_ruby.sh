#!/bin/bash

# Instalación de rbenv si no está instalado
sudo apt install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc  #Verifica el nombre de tu bash profile
echo 'eval "$(rbenv init -)"' >> ~/.zshrc  #Verifica el nombre de tu bash profile
source ~/.zshrc  #Verifica el nombre de tu bash profile
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 3.2.3
rbenv global 3.2.3