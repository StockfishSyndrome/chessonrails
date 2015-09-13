class Piece < ActiveRecord::Base
    belongs_to :user
    belongs_to :game

#    self.inheritance_column = nil


    def valid_move?(row, col)
        if self.col_pos == col && self.row_pos == row
            return false
        end
        return !self.is_obstructed?(row, col)
    end


    def self.types
        %w(Pawn King Queen Rook Knight Bishop)
    end


    def is_obstructed?(row,col)
      # check that move in in bounds, if not flag as obstructed
      if (self.col_pos - col).abs > 7 || (self.row_pos - row).abs > 7
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
            ((self.row_pos + 1)..row).each do |r|
              if !self.game.pieces.where("row_pos = ? AND col_pos = ?",r,i).blank?
                return true
              end
            end
          end
        elsif self.col_pos < col && self.row_pos > row
          ((self.col_pos + 1)..col).each do |i| # iterate through available columns
            (self.row_pos - 1).downto(row) do |r|
              if !self.game.pieces.where("row_pos = ? AND col_pos = ?",r,i).blank?
                return true
              end
            end
          end
        elsif self.col_pos > col && self.row_pos < row
          (self.col_pos - 1).downto(col) do |i| # iterate through available columns
            ((self.row_pos+1)..row).each do |r|
              if !self.game.pieces.where("row_pos = ? AND col_pos = ?",r,i).blank?
                return true
              end
            end
          end
        else
          (self.col_pos - 1).downto(col) do |i| # iterate through available columns
            (self.row_pos - 1).downto(row) do |r|
              if !self.game.pieces.where("row_pos = ? AND col_pos = ?",r,i).blank?
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

end
