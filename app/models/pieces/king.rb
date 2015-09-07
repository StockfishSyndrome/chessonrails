class King < Piece

    # weather valid_move or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the move is_valid or not
    def is_valid_move?(row, col)
        if super == false
            return false
        end
        # valid moves row-1, row+1, col-1, col+1
        # invalid moves  anything aka row/col > 1
        if (self.col_pos - col).abs > 1 || (self.row_pos - row).abs > 1
            return false
        end
        return true
=begin
        if (self.col_pos == col - 1) || (self.col_pos == col + 1)
            correct_move_col  = true
        else
            correct_move_col = false
        end
        if (self.row_pos == row - 1) || (self.row_pos == row + 1)
            correct_move_row = true
        else
            correct_move_row = false
        end

        if (correct_move_row && correct_move_col)
            return true
        end
=end
    end


end
