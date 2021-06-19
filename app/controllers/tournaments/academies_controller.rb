module Tournaments
  class AcademiesController < ApplicationController
    before_action :set_tournament

    def show
      @academy = Academy.find(params[:id])
    end

    def new
      @academy = Academy.new
    end

    def create
      @academy = Academy.new(academy_params.merge(tournaments: [@tournament]))

      if @academy.save
        redirect_to tournament_academy_path(@tournament, @academy)
      else
        render :new
      end
    end

    private

    def academy_params
      params.require(:academy).permit(:name)
    end

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end
  end
end
