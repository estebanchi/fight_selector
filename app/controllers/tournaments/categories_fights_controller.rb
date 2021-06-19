module Tournaments
  class CategoriesFightsController < ApplicationController
    before_action :set_tournament

    def index
      ::Tournaments::Fights::Set.new(tournament: @tournament).call! unless @tournament.fights.exists?
    end

    def show
      @category = Category.find(params[:id])
    end

    private

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end
  end
end
