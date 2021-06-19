class Fighter < ApplicationRecord
  belongs_to :level
  belongs_to :academy
  belongs_to :category
  has_many :fights_fighters
  has_many :fights, through: :fights_fighters

  scope :by_tournament, lambda { |tournament|
    joins(:fights).where(fights: { tournament: tournament })
  }
end
