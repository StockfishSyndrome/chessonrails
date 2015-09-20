class PiecesController < ApplicationController

  def select
    piece = Piece.find(params[:id])
    piece.update(is_selected: true)
    
    redirect_to game_path(piece.game)
  end
  
  private

  def piece_params
    params.required(:piece)
  end 
end
