class PiecesController < ApplicationController

  def select
    piece = Piece.find(params[:id])
    piece.update(is_selected: true)
    redirect_to game_path(piece.game)
  end
  def move
      selected_piece = Piece.where(is_selected: true, user_id: current_user.id).first
        if selected_piece
            square_id = params[:id].to_i
            row = square_id / 8
            col = square_id % 8

            valid_move = true

            if valid_move
                selected_piece.row_pos = row
                selected_piece.col_pos = col
                selected_piece.is_selected = false
                selected_piece.save
            end
        end
        redirect_to game_path(selected_piece.game)
  end

  private

  def piece_params
    params.required(:piece)
  end
end
