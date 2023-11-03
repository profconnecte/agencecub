class CreateFonctions < ActiveRecord::Migration[7.1]
  def change
    create_table :fonctions do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
