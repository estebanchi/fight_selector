module Tournaments
  class CategoriesController < ApplicationController
    before_action :set_tournament

    def index
      @category = @tournament.categories
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
