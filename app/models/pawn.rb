class Pawn < Piece

        # Piece is parent class
        # @param    row int row num of proposed move
        # @param    col int col num of proposed move
        # @return   bool weather the piece is_obstructed or not

        # 1) on its first move it can move forward 2 and cannot capture
        # 2) on any turn it can move forward 1 and cannot capture
        # 3) on any turn it can move diagonally forward 1 space and capture




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

            if first_move
                if ( self.row_pos + (2 * forward_modifier) == row)
                    if get_piece_at(row, col).present?
                        return false
                    else
                        return true
                    end
                end
            end

            if ( (self.col_pos - col).abs == 1 )
                if (self.row_pos + (1 * forward_modifier) == row )
                    if get_piece_at(row, col).present?
                        return true
                    else
                        return false
                    end
                end
            end

            if (self.row_pos + forward_modifier == row)
                if get_piece_at(row, col).present?
                    return false
                else
                    return true
                end
            end

            return false

        end

end
