class Castle < Piece

    # weather valid_move or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the move is_valid or not

    def is_valid_move(row, col)
        if super == false
            return false
        end

        #valid moves: any number of squares forwars, back or across but NOT diagonal

        # not sure if its needed
        if (self.col_pos - col).abs > 7 || (self.row_pos - row) > 7
            return false
        end

        if ( (self.col_pos - col).abs == (self.row_pos - row).abs )
            return false
        end
        return true
=begin
        # checking each diagonal move
        if ( (self.col_pos == col - 1) || (self.col_pos == col + 1) ) && ( (self.row_pos == row - 1) || (self.row_pos == row + 1) )
            return false
        end
        if ( (self.col_pos == col - 2) || (self.col_pos == col + 2) ) && ( (self.row_pos == row - 2) || (self.row_pos == row + 2) )
            return false
        end
        if ( (self.col_pos == col - 3) || (self.col_pos == col + 3) ) && ( (self.row_pos == row - 3) || (self.row_pos == row + 3) )
            return false
        end
        if ( (self.col_pos == col - 4) || (self.col_pos == col + 4) ) && ( (self.row_pos == row - 4) || (self.row_pos == row + 4) )
            return false
        end
        if ( (self.col_pos == col - 5) || (self.col_pos == col + 5) ) && ( (self.row_pos == row - 5) || (self.row_pos == row + 5) )
            return false
        end
        if ( (self.col_pos == col - 6) || (self.col_pos == col + 6) ) && ( (self.row_pos == row - 6) || (self.row_pos == row + 6) )
            return false
        end
        if ( (self.col_pos == col - 7) || (self.col_pos == col + 7) ) && ( (self.row_pos == row - 7) || (self.row_pos == row + 7) )
            return false
        end
=end

    end


end
