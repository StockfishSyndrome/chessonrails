require 'pry'

class Pawn < Piece


    # piece is parent class
    # weather valid_move? or not
    # @param    row int row num of proposed move
    # @param    col int col num of proposed move
    # @return   bool weather the piece is_obstructed or not

    # Usually one square forward.
    # If it is capturing an opposing piece,
    # however, it moves one square forward diagonally.
    # Each pawn may move two squares forward the first time it moves.
    # If it does, it cannot capture in the same move. Pawns can never move backwards.

    # check correct diag move (only one sqaure && only FORWARD)
    # black_player can only make negative diagonal MOVES
    # white_player can only make positive digonal moves
    # white --> row + 1 OR  black --> row - 1
    # It can only move col+1 or col-1
    # valid moves: ONLY FORWARD MOVES. from black_player perspective forward moves are -ve moves
    # and hence white player cal only move +ve side
    # forward_modifier is a variable to keep in check the forward move and is used throughout
    # the conditions to check valid moves


    def valid_move?(row, col)
        if super == false
            return false
        end

        # checking if the piece belongs_to black player. if it does then forward_modifier is -1 else 1
        if self.user == game.player_black
            forward_modifier = 1
        else
            forward_modifier = -1
        end

        if forward_modifier == 1
            first_move = (self.row_pos == 1)
        else
            first_move = (self.row_pos == 6)
        end
        #binding.pry

        if first_move # row_pos = 1 == 2 + 2 *
            if ( self.row_pos + (2 * forward_modifier) == row)
                return true
            end
        end

        if !self.game.pieces.where("row_pos = ? AND col_pos = ?",row,col).blank?
            if ( (self.col_pos == col + 1) || (self.col_pos == col - 1) )
                if (self.row_pos + (1 * forward_modifier) == row )
                    return true
                end
            end
        end

        # checking for black/white side player move
        if (self.row_pos + forward_modifier == row)
            return true
        end

        return false
    end
end
