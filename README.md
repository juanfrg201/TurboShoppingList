# Instalación del Entorno Ruby on Rails

## Instalación en Linux

Si estás en un sistema operativo Linux, ejecuta los siguientes comandos para dar permisos de ejecución a los scripts:

```bash
chmod +x install_ruby.sh
chmod +x install_rails.sh
chmod +x build.sh
```

Luego, para instalar el entorno y verificar el versionamiento de Rails y Ruby o instalarlos si no están disponibles, ademas revisar el nombre del bash profile que tienes activo y modificarlo segun el que tengas, ejecuta:

```bash
./build.sh
```

# Instalación manual de Rails (Si el anterior comando te surgio algun error)

## Instalación de Ruby con rbenv

```bash
sudo apt install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc  #Verifica el nombre de tu bash profiel
echo 'eval "$(rbenv init -)"' >> ~/.zshrc  #Verifica el nombre de tu bash profiel
source ~/.zshrc  #Verifica el nombre de tu bash profiel
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 3.2.3
rbenv global 3.2.3
```

## Instalación de Rails

```bash
sudo apt-get update
sudo apt-get install -y curl gnupg2 dirmngr
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install -y nodejs yarn
gem install rails "7.1.3"
```

Si ya tienes Rails instalado pero necesitas la versión 7.1.3, simplemente ejecuta:

```bash
gem install rails "7.1.3"
```

Luego, asegúrate de tener bundler instalado y ejecuta:
```bash
gem install bundler
```

# Configuración de la Aplicación

## Después de instalar Ruby on Rails, asegúrate de instalar las dependencias de la aplicación:

```bash
bundle install
```

## Crea la base de datos local:
```bash
rails db:create
```

## Genera los registros predefinidos:
```bash
rails db:seed
```

## Para los estilos de la aplicación, ejecuta:
```bash
rails assets:precompile
```

## Ejecutar la app en local
```bash
rails s
```