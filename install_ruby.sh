#!/bin/bash

# Clona el repositorio de rbenv desde GitHub si no está instalado
if [ ! -d "$HOME/.rbenv" ]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi

# Agrega rbenv al PATH de tu shell
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Clona el plugin ruby-build si no está instalado
if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# Instala Ruby 3.2.3 si no está instalado
if ! rbenv versions | grep -q "3.2.3"; then
    rbenv install 3.2.3
fi

# Configura la versión de Ruby como local en el directorio actual
rbenv local 3.2.3

echo "Ruby instalado correctamente."
