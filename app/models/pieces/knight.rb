class Knight < Piece

    # weather valid_move or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the move is_valid or not

    def is_valid_move?(row, col)
        if super == false
            return false
        end

    #valid moves: L shaped  two squares forward (or back) and one square across; or two squares across and one square forward (or back). The Knight can jump over other pieces while doing this.
=begin
    if (self.col_pos == col - 2) || (self.col_pos == col + 2)
        correct_move_col = true
    else
        correct_move_col = false
    end

    if (self.row_pos == row - 2) || (self.row_pos == row + 2)
        correct_move_row = true
    else
        correct_move_row = false
    end
=end
    # checking diagonal move
    if ( (self.col_pos - col).abs == (self.row_pos - row).abs )
        return false
    end

    # checking horizontal and vertical move (only two squares allowed to move)
    if (self.col_pos - col).abs == 2 || (self.row_pos - row) == 2
        correct_col_row_move =  true
    else
        correct_col_row_move = false
    end
    return true


end
