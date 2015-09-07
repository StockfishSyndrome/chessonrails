class Piece < ActiveRecord::Base
    belongs_to :user
    belongs_to :game

    has_many :categories

    delegate :king, :queen, :castle, :bishop, :knight, :pawn
end
