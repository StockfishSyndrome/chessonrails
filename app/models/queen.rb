class Queen < Piece

    # weather valid_move or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the move is_valid or not

    def valid_move?(row, col)
        if super == false
            return false
        end

        #valid moves: any number of sqaures diagonally
        if ( (self.col_pos - col).abs ) == ( (self.row_pos - row).abs )
            return true
        end

        return true
    end
end
