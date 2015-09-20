class PiecesController < ApplicationController
  
  def update
    Piece.find(params[:id]).update(is_selected: true)
    piece = Piece.find(params[:id])
    redirect_to game_path(piece.game)
  end

  private

  def piece_params
    params.required(:piece)
  end

  def select_piece
    piece = Piece.find(params[:id])
    #piece.is_selected = true
    #redirect_to games_path(piece.game.id)
  end
end
