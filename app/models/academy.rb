class Academy < ApplicationRecord
  has_many :registrations
  has_many :tournaments, through: :registrations
  has_many :fighters
end
