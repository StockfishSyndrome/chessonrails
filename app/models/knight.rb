require 'pry'
class Knight < Piece

    # weather valid_move or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the move is_valid or not



    def valid_move?(row, col)
        if super == false
            return false
        end


        # valid moves: L shaped  two squares forward (or back) and one square across.
        # or two squares across and one square forward (or back).
        # The Knight can jump over other pieces while doing this.

        # checking diagonal move NOT allowed
        if ( (self.col_pos - col).abs ) == ( (self.row_pos - row).abs )
            return false
        end

        # valid move: moving three squares in totat (either conbination of 2 row, 1 col OR 2 col, 1 row)
        if (self.col_pos - col).abs + (self.row_pos - row).abs == 3
            return true
        end

        return false

=begin
        if (self.col_pos - 2 == col) || (self.col_pos + 2 == col)
            return true
        end

        if (self.row_pos + 2 == row) || (self.row_pos + 2 == row)
            return true
        end

        # checking horizontal and vertical move (only two squares allowed to move)
        if ( (self.col_pos - col).abs == 2 ) && ( (self.row_pos - row).abs == 1 )
            return true
        end
=end
    end

end
