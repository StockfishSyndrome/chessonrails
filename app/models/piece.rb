class Piece < ActiveRecord::Base
    belongs_to :user
    belongs_to :game


    def is_obstructed?(row,col)
      # check that move in in bounds, if not flag as obstructed
      if row < 0 || col < 0 || row > 7 || col > 7
        return true
      end

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
      if ((row - self.row_pos).abs == (col - self.col_pos).abs)
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
        if self.col_pos < col && self.row_pos < row
          ((self.col_pos + 1)..col).each do |i| # iterate through available columns
            if !self.game.pieces.where("row_pos = ? AND col_pos = ?",row_pos + i,i).blank?
              return true
            end
          end           
        elsif self.col_pos < col && self.row_pos > row
          ((self.col_pos + 1)..col).each do |i| # iterate through available columns
            if !self.game.pieces.where("row_pos = ? AND col_pos = ?",row_pos - i,i).blank?
              return true
            end
          end 
        elsif self.col_pos > col && self.row_pos < row
          (self.col_pos - 1).downto(col) do |i| # iterate through available columns
            if !self.game.pieces.where("row_pos = ? AND col_pos = ?",row_pos + i,i).blank?
              return true
            end
          end          
        else 
          (self.col_pos - 1).downto(col) do |i| # iterate through available columns
            if !self.game.pieces.where("row_pos = ? AND col_pos = ?",row_pos - i,i).blank?
              return true
            end
          end   
        end  
        return false
      
      else
        if self.category == "knight"
          if #up 2, left 1 || up 2 right 1 || down 2, left 1 || down 2 right 1 || left 2 up 1 || left 2 down 1 || right 2 up 1 || right 2 down 1.blank?
            return true
          end
        end
        return false
      end       
    end
end
  