class Employe < ApplicationRecord
  belongs_to :agence
  belongs_to :fonction
end
