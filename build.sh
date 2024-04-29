#!/bin/bash

echo "Iniciando script de construcción..."


if ! command -v ruby &> /dev/null; then
  echo "Ruby no está instalado. Instalando..."
  ./install_ruby.sh
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