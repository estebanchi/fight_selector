module Tournaments
  module Academies
    module Fighters
      class Create
        def initialize(params:, tournament:, academy:)
          @params = params
          @tournament = tournament
          @academy = academy
          @level = Level.find(@params[:level_id])
        end

        def call!
          ActiveRecord::Base.transaction do
            @fighter = build_fighter
          end
        end

        private

        def build_fighter
          Fighter.new(@params.merge(academy: @academy,
                                    category: select_category))
        end

        def select_category
          @category = Category.set(@params[:weight]).by_level(@level.name).first

          unless @tournament.categories.exists?(level: @category&.level, min_weight: @category&.min_weight)
            @tournament.categories << @category
          end

          @category
        end
      end
    end
  end
end
