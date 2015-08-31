class Piece < ActiveRecord::Base
    belongs_to :user
    belongs_to :game


    def is_obstructed?
      if self.rank == "pawn"
        !self.game.pieces.where("col_pos = ? AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      elsif self.rank == "rook"
        !self.game.pieces.where("col_pos = ? AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ?",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ?",self.col_pos,self.row_pos).blank?
      elsif self.rank == "knight"
        !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? + 2",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1 AND row_pos = ? + 2",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? - 2",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1 AND row_pos = ? - 2",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 2 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? - 2 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? + 2 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 2 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      elsif self.rank == "bishop"
        !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? +1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      elsif self.rank == "queen"
        !self.game.pieces.where("col_pos = ? AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ?",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ?",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? +1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      else self.rank == "king"
        !self.game.pieces.where("col_pos = ? AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ?",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ?",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? +1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      end
    end

end
