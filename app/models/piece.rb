class Piece < ActiveRecord::Base
    belongs_to :user
    belongs_to :game


    def is_obstructed?
      if self.category == "pawn"
        !self.game.pieces.where("col_pos = ? AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      elsif self.category == "rook"
        !self.game.pieces.where("col_pos = ? AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ?",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ?",self.col_pos,self.row_pos).blank?
      elsif self.category == "knight"
        !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? + 2",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1 AND row_pos = ? + 2",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? - 2",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1 AND row_pos = ? - 2",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 2 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? - 2 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? + 2 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 2 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      elsif self.category == "bishop"
        !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? +1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      elsif self.category == "queen"
        !self.game.pieces.where("col_pos = ? AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ?",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ?",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? +1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      else self.category == "king"
        !self.game.pieces.where("col_pos = ? AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ?",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ?",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? - 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? +1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? &&
          !self.game.pieces.where("col_pos = ? - 1 AND row_pos = ? + 1",self.col_pos,self.row_pos).blank? && !self.game.pieces.where("col_pos = ? + 1  AND row_pos = ? - 1",self.col_pos,self.row_pos).blank?
      end
    end

end
