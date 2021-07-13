class Category < ApplicationRecord
  LEVELS_LIST = %i[BASICO INTERMEDIO AVANZADO].freeze
  
  has_many :tournaments_categories
  has_many :tournaments, through: :tournaments_categories
  has_many :fighters
  has_many :fights
  has_many :rounds

  validate :min_weight_per_level

  default_scope { order(min_weight: :asc) }

  scope :by_level, ->(level) { where(level: level) }
  scope :set, ->(weight) { where("max_weight >= #{weight} AND min_weight <= #{weight}") }

  def name
    if min_weight < 90
      "#{min_weight} - #{max_weight}"
    else
      'PESO COMPLETO'
    end
  end

  private

  def min_weight_per_level
    return unless Category.all.exists?(level: level, min_weight: min_weight)

    errors[:level] << 'Peso y nivel ya existen'
  end
end
