# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# agencecub
Site Web pour les agences CUB sous Ruby on Rails

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