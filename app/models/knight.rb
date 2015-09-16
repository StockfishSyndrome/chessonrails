class Knight < Piece

    # weather valid_move or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the move is_valid or not


    # valid moves: L shaped  two squares forward (or back) and one square across.
    # or two squares across and one square forward (or back).
    # The Knight can jump over other pieces while doing this.

    def valid_move?(row, col)
        #if super == false
        #    return false
        #end

        # checking for null move
        if self.col_pos == col && self.row_pos == row
            return false
        end

        # checking diagonal move NOT allowed
        if ( (self.col_pos - col).abs ) == ( (self.row_pos - row).abs )
            return false
        end

        # valid move: moving three squares in totat (either conbination of 2 row, 1 col OR 2 col, 1 row)
        if (self.col_pos - col).abs + (self.row_pos - row).abs == 3
            return true
        end

        return false

    end

end
