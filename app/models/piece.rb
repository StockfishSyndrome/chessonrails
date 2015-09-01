class Piece < ActiveRecord::Base
    belongs_to :user
    belongs_to :game


    def is_obstructed?(row,col)
      # pass in stuff for things :)
      vertical = false
      horizontal = false
      diagonal = false

      # check if move vertical
      if (col == self.col_pos)
        vertical = true
      end

      # check if move horizontal
      if (row == self.row_pos)
        horizontal = true
      end

      # check if move diagonal 
      if (row - self.row_pos == col - self.col_pos)
        diagonal = true
      end

      if vertical
        if self.row_pos > row # moving up on board
          (self.row_pos - 1).downto(row) do |i| # iterate through available rows
            if !self.game.pieces.where("row_pos = ? AND col_pos = ?",i,col).blank?
              return true
            end
          end
        else # moving down
          ((self.row_pos + 1)..row).each do |i| # iterate through available rows
            if !self.game.pieces.where("row_pos = ? AND col_pos = ?",i,col).blank?
              return true
            end
          end          
        end
        return false

      elsif horizontal
        if self.col_pos > col # moving left on board
          (self.col_pos - 1).downto(col) do |i| # iterate through available columns
            if !self.game.pieces.where("row_pos = ? AND col_pos = ?",row,i).blank?
              return true
            end
          end
        else # moving right
          ((self.col_pos + 1)..col).each do |i| # iterate through available columns
            if !self.game.pieces.where("row_pos = ? AND col_pos = ?",row,i).blank?
              return true
            end
          end          
        end
        return false

      elsif diagonal
        #return @obstructed
      else

      end       
    end
end
  