class PiecesController < ApplicationController

  def select
    piece = Piece.find(params[:id])
    game = Game.find(piece.game_id)
    if game.player_turn.even?
        flash[:alert] = "Wait for your turn"
    else
        piece.update(is_selected: true)
    end
    game.increment!(:player_turn)
    redirect_to game_path(piece.game)
  end

  def move
      selected_piece = Piece.where(is_selected: true, user_id: current_user.id, game_id: session[:current_game_id]).first
        if selected_piece
            square_id = params[:id].to_i
            dest_row = square_id / 8
            dest_col = square_id % 8

            if selected_piece.valid_move?(dest_row, dest_col)
              piece_at_dest = get_piece_at_dest(dest_row, dest_col)
              if piece_at_dest.present?
                capture(dest_row, dest_col)
              end
              selected_piece.row_pos = dest_row
              selected_piece.col_pos = dest_col
              selected_piece.is_selected = false
              selected_piece.save
              # change_turn
            end
        end
        redirect_to game_path(session[:current_game_id])
  end

  private

  def capture(row, col)
    piece_at_dest = get_piece_at_dest(row, col)
    piece_at_dest.row_pos = nil
    piece_at_dest.col_pos = nil
    piece_at_dest.save
  end

  def get_piece_at_dest(row, col)
    Piece.where(row_pos: row, col_pos: col, game_id: session[:current_game_id]).first
  end

  def select_piece
      @select_piece = Piece.find(params[:id])
  end
  def piece_params
    params.required(:piece)
  end
end
