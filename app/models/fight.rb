class Fight < ApplicationRecord
  belongs_to :category
  belongs_to :tournament
  belongs_to :round
  has_many :fights_fighters
  has_many :fighters, through: :fights_fighters

  validate :one_fight_per_fighters

  private

  def one_fight_per_fighters
    return unless Fight.joins(:fighters).exists?(fighters: fighters.first)

    errors[:fighters] << 'Fight exists'
  end
end
