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

        # check if destination has an ally piece
        destination_piece = get_piece_at(row, col)
        if destination_piece.present? && destination_piece.user == self.user
            return false
        end
        
        # valid moves for (row,col) are only (2,1) or (1,2)
        if ( (self.col_pos - col).abs == 2) && ( (self.row_pos - row).abs == 1 )
            return true
        elsif ( (self.col_pos - col).abs == 1) && ( (self.row_pos - row).abs == 2 )
            return true
        else
            return false
        end

        return false

    end

end
