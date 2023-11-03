# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Agences
# Agences
Agence.create(
  nom: 'Anvers',
  adresseip: '192.36.253.10',
  role: 'agence',
  image: 'anvers.jpg',
  url: 'www.anvers.cub.org'
)

Agence.create(
  nom: 'Barcelone',
  adresseip: '192.36.253.20',
  role: 'agence',
  image: 'barcelone.jpg',
  url: 'www.barcelone.cub.org'
)

Agence.create(
  nom: 'Californie',
  adresseip: '192.36.253.30',
  role: 'agence',
  image: 'californie.jpg',
  url: 'www.californie.cub.org'
)

Agence.create(
  nom: 'Dortmund',
  adresseip: '192.36.253.40',
  role: 'agence',
  image: 'dortmund.jpg',
  url: 'www.dortmund.cub.org'
)

Agence.create(
  nom: 'Edimbourg',
  adresseip: '192.36.253.50',
  role: 'agence',
  image: 'edimbourg.png',
  url: 'www.edimbourg.cub.org'
)

Agence.create(
  nom: 'Frankfurt',
  adresseip: '192.36.253.60',
  role: 'agence',
  image: 'frankfurt.jpg',
  url: 'www.frankfurt.cub.org'
)

Agence.create(
  nom: 'Galway',
  adresseip: '192.36.253.70',
  role: 'agence',
  image: 'galway.jpg',
  url: 'www.galway.cub.org'
)

Agence.create(
  nom: 'Hong-Kong',
  adresseip: '192.36.253.80',
  role: 'agence',
  image: 'hongkong.jpg',
  url: 'www.hongkong.cub.org'
)

Agence.create(
  nom: 'Siège (Paris)',
  adresseip: '192.36.253.254',
  role: 'siege',
  image: 'siege.jpg',
  url: 'www.cub.org'
)

# Continuez d'ajouter d'autres agences avec leurs URLs ici


# Fonctions
fonction_technicien = Fonction.create(libelle: 'Technicien')

# Agences
agence_hong_kong = Agence.find_by(nom: 'hong-kong')
agence_anvers = Agence.find_by(nom: 'anvers')
agence_dortmund = Agence.find_by(nom: 'dortmund')
agence_edimbourg = Agence.find_by(nom: 'edimbourg')
agence_barcelone = Agence.find_by(nom: 'barcelone')
agence_californie = Agence.find_by(nom: 'californie')
agence_frankfurt = Agence.find_by(nom: 'frankfurt')
agence_galway = Agence.find_by(nom: 'galway')
agence_siege = Agence.where("nom LIKE ?", "%siège%").first

# Employés
Employe.create(nom: 'AMY', prenom: 'Sarah', agence: agence_hong_kong, fonction: fonction_technicien)
Employe.create(nom: 'BOESCH', prenom: 'Johann', agence: agence_anvers, fonction: fonction_technicien)
Employe.create(nom: 'CARVALHAIS DO COUTO', prenom: 'Alban', agence: agence_dortmund, fonction: fonction_technicien)
Employe.create(nom: 'DERE', prenom: 'Thomas', agence: agence_edimbourg, fonction: fonction_technicien)
Employe.create(nom: 'GUIGNIER', prenom: 'Donovan', agence: agence_anvers, fonction: fonction_technicien)
Employe.create(nom: 'JEANNY', prenom: 'Lukas', agence: agence_barcelone, fonction: fonction_technicien)
Employe.create(nom: 'LAWSON-PLACCA', prenom: 'Boris', agence: agence_dortmund, fonction: fonction_technicien)
Employe.create(nom: 'MADI', prenom: 'Tadjid', agence: agence_californie, fonction: fonction_technicien)
Employe.create(nom: 'PENAGOS', prenom: 'Mathis', agence: agence_frankfurt, fonction: fonction_technicien)
Employe.create(nom: 'POLENTES', prenom: 'Axel', agence: agence_edimbourg, fonction: fonction_technicien)
Employe.create(nom: 'RASCAGNERES', prenom: 'William', agence: agence_barcelone, fonction: fonction_technicien)
Employe.create(nom: 'RATTE', prenom: 'Yanis', agence: agence_frankfurt, fonction: fonction_technicien)
Employe.create(nom: 'ROUQUIÉ', prenom: 'Timothé', agence: agence_hong_kong, fonction: fonction_technicien)
Employe.create(nom: 'SAUSSERET', prenom: 'Paul', agence: agence_galway, fonction: fonction_technicien)
Employe.create(nom: 'STIVALET', prenom: 'Quentin', agence: agence_galway, fonction: fonction_technicien)

# Ajout de l'employé PDG de l'agence siège
Employe.create(nom: 'MARTIN', prenom: 'Alexandre', agence: agence_siege, fonction: Fonction.create(libelle: 'PDG'))
