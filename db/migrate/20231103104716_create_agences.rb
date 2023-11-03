class CreateAgences < ActiveRecord::Migration[7.1]
  def change
    create_table :agences do |t|
      t.string :nom
      t.string :role
      t.string :adresseip
      t.string :image

      t.timestamps
    end
  end
end
