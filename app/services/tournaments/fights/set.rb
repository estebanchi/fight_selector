module Tournaments
  module Fights
    class Set
      def initialize(tournament:)
        @tournament = tournament
        @categories = @tournament.categories
      end

      def call!
        ActiveRecord::Base.transaction do
          select_categories

          @categories.each do |c|
            c.rounds.create(number: 1)
            @fighters = c.fighters.order('RANDOM()')

            @fighters.each_slice(2) do |f|
              @fight = build_fight(fighters: f, category: c)

              @fight.save
            end
          end
        end
      end

      private

      def build_fight(fighters:, category:)
        Fight.new(category: category,
                  round: category.rounds.first,
                  tournament: @tournament,
                  fighters: fighters)
      end

      def select_categories
        @categories.each do |c|
          next unless c.fighters.count < 3

          c.fighters.each do |f|
            @cat = @categories.joins(:fighters).group('categories.id')
                              .having('COUNT(fighters.id) > 1')
                              .min_by { |x| (x.min_weight - f.weight).abs }

            f.update(category: @cat)
            @tournament.categories.delete(c)
          end
        end
      end
    end
  end
end
