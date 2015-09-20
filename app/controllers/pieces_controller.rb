class PiecesController < ApplicationController
  def select
    piece = Piece.find(params[:id])
    piece.update(is_selected: true)

    redirect_to game_path(piece.game)
  end

  # exercise: what could go wrong in this method? how could it fail?
  def move
    selected_piece = Piece.where(is_selected: true, user_id: current_user.id).first
    if selected_piece
      square_id = params[:id].to_i
      row = square_id / 8
      col = square_id % 8
      
      # put some logic here for determining if the move is valid
      valid_move = true
      if valid_move
        # put some logic here to determine if a piece is being captured
        captured_piece = false
        if captured_piece
          # put some logic here to handle the capture of a piece
        end
        
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
