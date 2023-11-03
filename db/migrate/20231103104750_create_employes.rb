class CreateEmployes < ActiveRecord::Migration[7.1]
  def change
    create_table :employes do |t|
      t.string :nom
      t.string :prenom
      t.references :agence, null: false, foreign_key: true
      t.references :fonction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
