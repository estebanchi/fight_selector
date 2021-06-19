class Round < ApplicationRecord
  belongs_to :category
  has_many :fights
end
