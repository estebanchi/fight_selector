module Tournaments
  module Academies
    class FightersController < ApplicationController
      before_action :set_variables

      def new
        @fighter = Fighter.new
      end

      def create
        @fighter = ::Tournaments::Academies::Fighters::Create.new(params: fighter_params,
                                                                  academy: @academy,
                                                                  tournament: @tournament).call!

        if @fighter.save!
          redirect_to tournament_academy_path(@tournament, @academy)
        else
          render :new
        end
      end

      private

      def fighter_params
        params.require(:fighter).permit(%i[age name document weight level_id])
      end

      def set_variables
        @tournament = Tournament.find(params[:tournament_id])
        @academy = Academy.find(params[:academy_id])
      end
    end
  end
end
