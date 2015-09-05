class Queen < Piece

    # weather valid_move or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the move is_valid or not

    def is_valid_move?(row, col)
        if super == false
            return false
        end

        # valid moves: any numbers of squares in any direction
        # not sure if its needed
        if (self.col_pos - col).abs > 7 || (self.row_pos - row) > 7
            return false
        end
        return true
    end


end
