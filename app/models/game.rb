class Game < ActiveRecord::Base
  belongs_to :player_white, :class_name => 'User'
  belongs_to :player_black, :class_name => 'User'
  
  has_many :pieces

  validates :player_white_id, :numericality => {only_integer: true}
  validates :player_black_id, :numericality => {only_integer: true}


  def populate_board
    @category = ""
    @row = nil
    @column = nil
    @player = nil

    (0..31).each do |i|
      if i < 8
        @row = 0
        @column = i
        @player = player_black_id
      elsif i < 16
        @row = 1
        @column = i - 8
        @player = player_black_id
      elsif i < 24
        @row = 6
        @column = i - 16
        @player = player_white_id
      else
        @row = 7
        @column = i - 24
        @player = player_white_id
      end

      if @row == 1 || @row == 6
        @category = "pawn"
      elsif @column == 0 || @column == 7
        @category = "rook"
      elsif @column == 1 || @column == 6
        @category = "knight"
      elsif @column == 2 || @column == 5
        @category = "bishop"
      elsif @column == 3 
        @category = "queen"
      else
        @category = "king"
      end

      Piece.create(game_id: self.id,user_id: @player,category: @category, row_pos: @row, col_pos: @column)
    end
  end
end
