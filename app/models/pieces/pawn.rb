class Pawn < Piece

    # piece is parent class
    # weather valid_move or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the piece is_obstructed or not

    def is_valid_move?(row, col)
        if super == false
            return false
        end

        # valid moves: ONLY FORWARD MOVES: row + 1, col + 1, (row_pos - row).abs == (col_pos - col).abs, row+2, col+2

        #checking correct col moves
        if (self.col_pos == col + 1) || (self.col_pos == col + 2)
            correct_col_move = true
        else
            correct_col_move = false
        end

        # checking correct row moves
        if (self.row_pos == row + 1) || (self.row_pos == row + 2)
            correct_row_move = true
        else
            correct_row_move = false
        end

        # checking correct diag move (only one sqaure && only FORWARD)
        if (self.col_pos == col + 1) == (self.row_pos == row + 1)
            correct_diag_move = true
        else
            correct_diag_move = false
        end

        return true
    end


end
