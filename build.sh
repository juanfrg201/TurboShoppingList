#!/bin/bash

echo "Iniciando script de construcción..."


if ! command -v rails &> /dev/null || [[ "$(ruby -v | awk '{print $2}')" != "3.2.3" ]]; then
    ./install_ruby.sh
else
    echo "Rails está instalado y la versión de Ruby es la 3.2.3"
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


rails_version=$(rails -v | awk '{print $2}')
desired_rails_version="7.1.3"

if [[ "$rails_version" != "$desired_rails_version" ]]; then
    echo "La versión de Rails instalada ($rails_version) no coincide con la versión deseada ($desired_rails_version). Instalando la versión deseada..."

    # Instala la versión específica de Rails
    gem install rails -v 7.1.3

    # Verifica si la instalación fue exitosa
    if ! gem list rails -i -v "$desired_rails_version" &> /dev/null; then
        echo "Error: La instalación de Rails $desired_rails_version ha fallado. No se puede continuar con la construcción."
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

echo "Creando la base de datos..."
rails db:create

echo "Migrando la Base de datos"
rails db:migrate

rails db:seed

yarn build:css

echo "Compilando assets de Rails..."
rails assets:precompile