class Category < ActiveRecord::Base
    belongs_to :piece
    self.inheritance_column = :type

    validates :type, presence: true

    scope :king, -> { where(type: 'King') }

    def valid_move?(row, col)
        if self.col_pos == col && self.row_pos == row
            return false
        end
        return !self.is_obstructed?(row, col)
    end

    class << self
        def types
            %w(King Queen Castle Bishop Knight Pawn)
        end
    end
end
