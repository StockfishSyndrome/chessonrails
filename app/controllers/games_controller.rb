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

    helper_method :selected_piece, :piece_color
    def selected_piece(row,col)
        piece = piece_finder(row,col)
        if piece
            @selected_piece = piece.type
        else 
            @selected_piece = ""
        end
        @selected_piece
    end

    def piece_color(row,col)
        piece = piece_finder(row,col)
        if piece
            if piece.user_id == 1
                color = "Black"
            elsif piece.user_id == 2
                color = "White"
            else
                color = ""
            end
        end
        color
    end

    def piece_finder(row,col)
        piece = @pieces.find {|p| p.row_pos == row && p.col_pos == col}
    end
end
