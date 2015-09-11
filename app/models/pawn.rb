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



        # checking if piece belongs_to black player
        if piece.user == game.player_black_id
            black_modifier = -1
        else
            black_modifier = 1
        end

        if black_modifier == 1
            first_move = (self.row_pos == 6)
        else
            first_move = (self.row_pos == 1)
        end

        if first_move
            if ( self.row_pos == row + (2 * black_modifier) )
                return true
            end
        end

        if !self.game.pieces.where("row_pos = ? AND col_pos = ?",row,col).blank?
            if ( (self.col_pos == col + 1) || (self.col_pos == col - 1) )
                if (self.row_pos == row + (1 * black_modifier))
                    return true
                end
            end
        end

        # checking for black/white side player move
        if (self.row_pos == row + black_modifier)
            return true
        end

        # checking correct diag move (only one sqaure && only FORWARD)
        # black_player can only make negative diagonal MOVES
        # white_player can only make positive digonal moves
        # white --> row + 1 OR  black --> row - 1
        # It can only move col+1 or col-1


        return false


    end


end
