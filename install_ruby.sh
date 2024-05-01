#!/bin/bash

# Instalación de rbenv si no está instalado
sudo apt install rbenv
if ! command -v rbenv &> /dev/null; then
    echo "Instalando rbenv..."
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc
    source ~/.zshrc
fi

# Instalación de ruby-build si no está instalado
if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
    echo "Instalando ruby-build..."
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# Instalación de Ruby 3.2.3
echo "Instalando Ruby 3.2.3..."
rbenv install 3.2.3

# Configuración global de Ruby para la versión 3.2.3
rbenv local 3.2.3

# Verificación de la instalación
ruby -v

echo "La instalación de Ruby 3.2.3 se ha completado correctamente."