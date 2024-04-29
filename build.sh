#!/bin/bash

echo "Iniciando script de construcción..."


if ! command -v ruby &> /dev/null; then
    echo "Ruby no está instalado. Instalando..."
    ./install_ruby.sh
else
    # Verifica la versión de Ruby instalada
    ruby_version=$(ruby -v | awk '{print $2}')
    if [[ "$ruby_version" != "3.2.3" ]]; then
        echo "La versión de Ruby instalada no es la 3.2.3. Instalando la versión 3.2.3..."
        # Ejecuta el script de instalación de Ruby 3.2.3
        ./install_ruby.sh
    else
        echo "Ruby ya está instalado y es la versión 3.2.3"
    fi
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