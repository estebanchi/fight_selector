class Tournament < ApplicationRecord
  has_many :registrations
  has_many :academies, through: :registrations
  has_many :tournaments_categories
  has_many :categories, through: :tournaments_categories
  has_many :fights
end
