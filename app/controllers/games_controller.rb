class GamesController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    
    def index
        @games = Game.all
    end

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
        @game = Game.where(:id => params[:id]).first
        if !@game.blank?
            @pieces = @game.pieces.to_a
	else
            render :text => "Not found", :status => :not_found
        end
    end

    def update
        @game = Game.where(:id => params[:id]).first        
	if current_user.id == @game.player_white_id
            redirect_to game_path(@game)
        else 
            @game.update(:player_black_id => current_user.id)
            @game.populate_board
            redirect_to game_path(@game)
        end
    end
    

    private

    def game_params
        params.required(:game).permit(:name,:player_white_id, :player_black_id)
    end
    
    helper_method :select_piece
    def select_piece(id)
      @game = Game.find_by_id(params[:id])
      Piece.find_by_id(id).is_selected = true      
      @game.pieces.first.is_selected = true 
    end
end
