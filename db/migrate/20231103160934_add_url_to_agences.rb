class AddUrlToAgences < ActiveRecord::Migration[7.1]
  def change
    add_column :agences, :url, :string
  end
end
