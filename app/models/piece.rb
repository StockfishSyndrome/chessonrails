class Piece < ActiveRecord::Base
    belongs_to :user
    belongs_to :game
   
    def valid_move?(row, col)        
        if self.col_pos == col && self.row_pos == row
          return false
        elsif is_obstructed?(row, col)
          return false
        elsif is_out_of_bounds?(row,col)
          return false
        else
          return true
        end
    end


    def self.types
        %w(Pawn King Queen Rook Knight Bishop)
    end

    def is_obstructed?(row,col)

      vertical = false
      horizontal = false
      diagonal = false

      destination_piece = get_piece_at(row,col)
      if destination_piece.present? && destination_piece.user == self.user
        return true
      end

      # Determine direction of movement
      # check if move vertical
      if (col == self.col_pos)
        vertical = true
      end

      # check if move horizontal
      if (row == self.row_pos)
        horizontal = true
      end

      # check if move diagonal
      if ((row - self.row_pos).abs == (col - self.col_pos).abs)
        diagonal = true
      end

      # Step through vertical spaces, checking for occupancy
      if vertical
        if self.row_pos > row # moving up on board
          (self.row_pos - 1).downto(row+1) do |i| # iterate through available rows
            if self.game.pieces.where("row_pos = ? AND col_pos = ?",i,col).present?
              return true
            end
          end
        else # moving down
          ((self.row_pos + 1)..row-1).each do |i| # iterate through available rows
            if self.game.pieces.where("row_pos = ? AND col_pos = ?",i,col).present?
              return true
            end
          end
        end
        return false

      # Step through horizontal spaces, checking for occupancy  
      elsif horizontal
        if self.col_pos > col # moving left on board
          (self.col_pos - 1).downto(col+1) do |i| # iterate through available columns
            if self.game.pieces.where("row_pos = ? AND col_pos = ?",row,i).present?
              return true
            end
          end
        else # moving right
          ((self.col_pos + 1)..col-1).each do |i| # iterate through available columns
            if self.game.pieces.where("row_pos = ? AND col_pos = ?",row,i).present?
              return true
            end
          end
        end
        return false

      #Step diagonally through spaces, checking for occupancy
      elsif diagonal
        if self.col_pos < col && self.row_pos < row
          ((self.col_pos + 1)..col-1).each do |i| # iterate through available columns
            ((self.row_pos + 1)..row-1).each do |r|
              if self.game.pieces.where("row_pos = ? AND col_pos = ?",r,i).present?
                return true
              end
            end
          end
        elsif self.col_pos < col && self.row_pos > row
          ((self.col_pos + 1)..col-1).each do |i| # iterate through available columns
            (self.row_pos - 1).downto(row+1) do |r|
              if self.game.pieces.where("row_pos = ? AND col_pos = ?",r,i).present?
                return true
              end
            end
          end
        elsif self.col_pos > col && self.row_pos < row
          (self.col_pos - 1).downto(col+1) do |i| # iterate through available columns
            ((self.row_pos+1)..row-1).each do |r|
              if self.game.pieces.where("row_pos = ? AND col_pos = ?",r,i).present?
                return true
              end
            end
          end
        else
          (self.col_pos - 1).downto(col+1) do |i| # iterate through available columns
            (self.row_pos - 1).downto(row+1) do |r|
              if self.game.pieces.where("row_pos = ? AND col_pos = ?",r,i).present?
                return true
              end
            end
          end
        end
        return false

      else
        return true
      end
    end

    # check to see if move it outside of game board. 
    # row and col must both fall between 0 and 7
    def is_out_of_bounds?(row,col)
      if row < 0 || col < 0 || row > 7 || col > 7
        return true
      end
    end

   def get_piece_at(row, col)
     Piece.where(row_pos: row, col_pos: col, game_id: self.game_id).first
   end
end
