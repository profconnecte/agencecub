# README

# agencecub
Site Web pour les agences CUB sous Ruby on Rails

## Installation sur Ubuntu

### 1. Installation de ruby
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
    sudo apt install ruby-full bundler

### 2. Installation de node-js
    sudo apt install nodejs npm
    npm install -g yarn

### 3. Installation de MySQL Server
    sudo apt-get install mysql-server mysql-client libmysqlclient-dev

### 4. Installation de phpmyadmin pour apache2
    sudo apt install phpmyadmin

## 5. Ajout d'un utilisateur admin dans MySQL
    sudo mysql

Puis dans la console mysql :

    CREATE USER 'nom_utilisateur_choisi'@'localhost' IDENTIFIED BY 'mot_de_passe_solide';
    GRANT ALL ON *.* TO 'nom_utilisateur_choisi'@'localhost' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    QUIT;

### 6. Installation de rails
    gem install rails -v 7.1.1



# Installation
Utilisation des sites [https://github.com/rubygems/rubygems/discussions/6760](https://github.com/rubygems/rubygems/discussions/6760) et [https://discuss.rubyonrails.org/t/cant-setup-rails-psych-yaml-issue/83968/2](https://discuss.rubyonrails.org/t/cant-setup-rails-psych-yaml-issue/83968/2)

## Installation des packages avec Bundle
Pour définir une variable d'environnement, telle que GEM_HOME, de manière permanente à chaque démarrage de votre système, vous pouvez le faire en fonction de votre système d'exploitation. Voici comment faire cela sur Linux en utilisant un fichier de configuration de shell (comme .bashrc ou .bash_profile) :

1. Ouvrez un terminal.

2. Utilisez un éditeur de texte de votre choix pour ouvrir le fichier de configuration de shell correspondant à votre environnement. Par exemple, pour Bash, vous pouvez utiliser la commande suivante pour ouvrir le fichier .bashrc :

`nano ~/.bashrc`

3. Ajoutez la ligne suivante à la fin du fichier de configuration, en remplaçant la valeur par le chemin de votre choix :

`export GEM_HOME=$HOME/.gem/ruby/3.1.0/`

4. Enregistrez les modifications et fermez l'éditeur de texte. Dans Nano, vous pouvez appuyer sur Ctrl + O pour enregistrer, puis Ctrl + X pour quitter.

5. Pour rendre les modifications effectives sans avoir à redémarrer votre terminal, rechargez la configuration de votre shell en exécutant la commande suivante :
    
`source ~/.bashrc`

Maintenant, à chaque démarrage de votre terminal, la variable GEM_HOME sera automatiquement définie avec la valeur que vous avez spécifiée.

Si vous utilisez un autre shell (comme Zsh, Fish, etc.), le processus peut être légèrement différent, mais l'idée générale reste la même : ajoutez la variable d'environnement dans le fichier de configuration correspondant au shell que vous utilisez.