class GamesController < ApplicationController
    before_action :authenticate_user!

    def new
        @game = Game.new
    end

    def create
        @game = Game.create(game_params)
        if @game.valid?
        redirect_to game_path(@game)
        else
        render :new, :status => :unprocessable_entity
        end
    end

    def show
        @game = Game.where(:id => params[:id])
    end

    private

    def game_params
        params.required(:game).permit(:player_one_id, :player_two_id)
    end
end
