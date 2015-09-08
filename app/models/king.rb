class King < Piece

    # piece is parent class
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the piece is_obstructed or not

    def valid_move?(row, col)
        if super == false
            return false
        end
        # valid moves row-1, row+1, col-1, col+1
        # invalid moves  any row/col > 1
        if (self.col_pos - col).abs > 1 || (self.row_pos - row).abs > 1
            return false
        end

    return true
    end


end
