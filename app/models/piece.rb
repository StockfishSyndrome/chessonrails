class Piece < ActiveRecord::Base
    belongs_to :user
    belongs_to :game
   
    # valid_move? accepts row and column destination position and checks whether 
    # the piece is trying to remain stationary, if it is obstructed, and if it is out of bounds
    # Type Specific validation is handled in child classes.
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

    # STI implementation for various types of pieces
    def self.types
        %w(Pawn King Queen Rook Knight Bishop)
    end

    # is_obstructed? accepts row and column destination position data and returns a boolean 
    # A generic piece's move is considered obstructed in the following scenarios:
    # - There are pieces between it's starting position and it's destination position
    # - It's destination position is occupied by a piece belonging to the same user who owns the moving piece
    def is_obstructed?(row,col)

      vertical = false
      horizontal = false
      diagonal = false

      # Check for piece at destination. If own piece, mark as obstructed.
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
          (self.row_pos - 1).downto(row+1) do |r| # iterate through available rows
            if get_piece_at(r,col).present?
              return true
            end
          end
        else # moving down
          ((self.row_pos + 1)..row-1).each do |r| # iterate through available rows
            if get_piece_at(r,col).present?
              return true
            end
          end
        end
        return false

      # Step through horizontal spaces, checking for occupancy  
      elsif horizontal
        if self.col_pos > col # moving left on board
          (self.col_pos - 1).downto(col+1) do |c| # iterate through available columns
            if get_piece_at(row,c).present?
              return true
            end
          end
        else # moving right
          ((self.col_pos + 1)..col-1).each do |c| # iterate through available columns
            if get_piece_at(row,c).present?
              return true
            end
          end
        end
        return false

      #Step diagonally through spaces, checking for occupancy
      elsif diagonal
        if self.col_pos < col && self.row_pos < row
          ((self.col_pos + 1)..col-1).each do |c| # iterate through available columns
            ((self.row_pos + 1)..row-1).each do |r|
              if get_piece_at(r,c).present?
                return true
              end
            end
          end
        elsif self.col_pos < col && self.row_pos > row
          ((self.col_pos + 1)..col-1).each do |c| # iterate through available columns
            (self.row_pos - 1).downto(row+1) do |r|
              if get_piece_at(r,c).present?
                return true
              end
            end
          end
        elsif self.col_pos > col && self.row_pos < row
          (self.col_pos - 1).downto(col+1) do |c| # iterate through available columns
            ((self.row_pos+1)..row-1).each do |r|
              if get_piece_at(r,c).present?
                return true
              end
            end
          end
        else
          (self.col_pos - 1).downto(col+1) do |c| # iterate through available columns
            (self.row_pos - 1).downto(row+1) do |r|
              if get_piece_at(r, c).present?
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

    # accepts row and col and returns a piece found at that coordinate
    def get_piece_at(row, col)
     Piece.where(row_pos: row, col_pos: col, game_id: self.game_id).first
    end
end
