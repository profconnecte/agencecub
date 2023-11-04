# README

# agencecub
Site Web pour les agences CUB sous Ruby on Rails

## Installation sur Ubuntu

### 1. Installation de ruby
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
    sudo apt install ruby-full bundler

Puis

    echo 'export GEM_HOME=$HOME/.gem/ruby/3.1.0/' >> ~/.bashrc
    source ~/.bashrc

### 2. Installation de node-js
    sudo apt install nodejs npm
    npm install -g yarn

### 3. Installation de MySQL Server
    sudo apt-get install mysql-server mysql-client libmysqlclient-dev

### 4. Installation de phpmyadmin pour apache2
    sudo apt install phpmyadmin

### 5. Ajout d'un utilisateur admin dans MySQL
    sudo mysql

Puis dans la console mysql :

    CREATE USER 'nom_utilisateur_choisi'@'localhost' IDENTIFIED BY 'mot_de_passe_solide';
    GRANT ALL ON *.* TO 'nom_utilisateur_choisi'@'localhost' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    QUIT;

### 6. Installation de rails
    gem install rails -v 7.1.1

### 7. Création d'un utilisateur 'deploy'
    sudo adduser deploy
    sudo usermod -aG sudo deploy
    su deploy
    cd
    echo 'export GEM_HOME=$HOME/.gem/ruby/3.1.0/' >> ~/.bashrc
    source ~/.bashrc

### 8. Création de la base de données et de l'utilisateur pour l'application
Dans un shell MySQL:

    CREATE DATABASE IF NOT EXISTS agencecub;
    CREATE USER IF NOT EXISTS 'deploy'@'localhost' IDENTIFIED BY 'mot_de_passe';
    CREATE USER IF NOT EXISTS 'deploy'@'%' IDENTIFIED BY 'mot_de_passe';
    GRANT ALL PRIVILEGES ON agencecub.* TO 'deploy'@'localhost';
    GRANT ALL PRIVILEGES ON agencecub.* TO 'deploy'@'%';
    FLUSH PRIVILEGES;
    QUIT;

### 9. Installation de Passenger
    sudo apt-get install -y libapache2-mod-passenger
    sudo a2enmod passenger
    sudo apache2ctl restart

### 10. Récupération de l'application
    sudo mkdir /var/www/agencecub
    sudo chown -R deploy:deploy /var/www/agencecub
    cd /var/www/agencecub
    git clone https://github.com/profconnecte/agencecub.git .

### 11. Installation des dépendances de l'application
    bundle config set --local deployment 'true'
    bundle config set --local without 'development test'
    gem update bundler
    bundle install
    bundle config set frozen false
    bundle update
    bundle config set frozen true

### 12. Configuration de la base de données
    echo 'export DATABASE_URL="mysql2://deploy:mot_de_passe@localhost/agencecub"' >> /etc/apache2/envvars
    nano config/database.yml

Assurez-vous que le section production correspond à ceci :
    production:
      url: <%= ENV['DATABASE_URL'] %>

Puis
    nano config/environments/production.rb

Modifier la ligne `config.force_ssl = true` en `config.force_ssl = false`

Puis

    rm config/credentials.yml.enc
    EDITOR=nano bin/rails credentials:edit
    bundle exec rails assets:precompile db:migrate RAILS_ENV=production
    RAILS_ENV=production bundle exec rails db:seed

## Configuration d'Apache et Passenger
### 1. Déterminer la commande ruby à utiliser
    passenger-config about ruby-command

## 2. Création du fichier de configuration de l'hôte virtuel dans Apache
    sudo nano /etc/apache2/sites-available/agencecub.conf

Placer dans ce fichier :

    <VirtualHost *:80>
        ServerName www.anvers.cub.org

        DocumentRoot /var/www/agencecub/public

        ErrorLog ${APACHE_LOG_DIR}/agencecub_error.log
        CustomLog ${APACHE_LOG_DIR}/agencecub_access.log combined

        PassengerRuby /usr/bin/ruby3.1

        <Directory /var/www/agencecub/public>
        Allow from all
        Options -MultiViews
        # Uncomment this if you're on Apache ≥ 2.4:
        Require all granted
        </Directory>
    </VirtualHost>

Puis 
    sudo a2dissite 000-default.conf
    sudo a2ensite agencecub.conf
    sudo systemctl reload apache2

Enfin on enlève l'utilisateur deploy du groupe sudo : `sudo deluser deploy sudo`

## Tests
Tester l'accès avec curl : `curl http://www.anvers.cub.org` puis avec firefox en mode navigation privé si vous constatez un problème.

## Sources
### Déploiement :
- [https://gorails.com/deploy/ubuntu/22.04](https://gorails.com/deploy/ubuntu/22.04)
- [https://www.phusionpassenger.com/docs/tutorials/deploy_to_production/deploying_your_app/oss/ownserver/ruby/apache/](https://www.phusionpassenger.com/docs/tutorials/deploy_to_production/deploying_your_app/oss/ownserver/ruby/apache/)

### Correction des Problèmes :
Utilisation des sites :
- [https://github.com/rubygems/rubygems/discussions/6760](https://github.com/rubygems/rubygems/discussions/6760)
- [https://discuss.rubyonrails.org/t/cant-setup-rails-psych-yaml-issue/83968/2](https://discuss.rubyonrails.org/t/cant-setup-rails-psych-yaml-issue/83968/2)
