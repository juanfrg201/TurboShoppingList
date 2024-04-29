#!/bin/bash

echo "Iniciando script de construcción..."


if ! command -v ruby &> /dev/null; then
  echo "Ruby no está instalado. Instalando..."
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
fi

# Verifica si Rails está instalado
if ! command -v rails &> /dev/null; then
  echo "Rails no está instalado. Ejecutando instalación de Rails..."
  ./install_rails.sh

  # Verifica si la instalación de Rails fue exitosa
  if ! command -v rails &> /dev/null; then
      echo "Error: La instalación de Rails ha fallado. No se puede continuar con la construcción."
      exit 1
  fi
fi


# Verifica si Bundler está instalado
if ! command -v bundle &> /dev/null; then
  echo "Bundler no está instalado. Instalando..."
  gem install bundler
fi

echo "Instalando dependencias..."
bundle install
echo "Finalización de la instalación. Recuerda ejecutar 'rails db:create'."
rails db:create