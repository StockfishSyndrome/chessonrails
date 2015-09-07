require 'test_helper'

class PieceTest < ActiveSupport::TestCase
  test "vertical move, unobstructed" do
      piece = FactoryGirl.create(:piece)
      assert(!piece.is_obstructed?(2,1))
      assert(!piece.is_obstructed?(0,1))
  end

  test "vertical move, obstructed" do
      piece = FactoryGirl.create(:piece)
      piece_two = FactoryGirl.create(:piece, game_id: 999, row_pos: 2)
      piece_three = FactoryGirl.create(:piece, game_id: 999, row_pos: 0)
      assert(piece.is_obstructed?(2,1))
      assert(piece.is_obstructed?(0,1))
  end

  test "horizontal move, unobstructed" do
      piece = FactoryGirl.create(:piece)
      assert(!piece.is_obstructed?(1,2))
      assert(!piece.is_obstructed?(1,0))
  end

  test "horizontal move, obstructed" do
      piece = FactoryGirl.create(:piece)
      piece_two = FactoryGirl.create(:piece, game_id: 999, col_pos: 2)
      piece_three = FactoryGirl.create(:piece, game_id: 999, col_pos: 0)
      assert(piece.is_obstructed?(1,2))
      assert(piece.is_obstructed?(1,0))
  end

  test "diagonal move, unobstructed" do
      piece = FactoryGirl.create(:piece)
      assert(!piece.is_obstructed?(2,2))
      assert(!piece.is_obstructed?(0,0))
      assert(!piece.is_obstructed?(0,2))
      assert(!piece.is_obstructed?(2,0))
  end

  test "diagonal move, obstructed" do
      piece = FactoryGirl.create(:piece)
      piece_two = FactoryGirl.create(:piece, game_id: 999, row_pos: 2, col_pos: 2)
      piece_three = FactoryGirl.create(:piece, game_id: 999, row_pos: 0, col_pos: 0)
      piece_four = FactoryGirl.create(:piece, game_id: 999, row_pos: 0, col_pos: 2)
      piece_five = FactoryGirl.create(:piece, game_id: 999, row_pos: 2, col_pos: 0)
      assert(piece.is_obstructed?(2,2))
      assert(piece.is_obstructed?(0,0))
      assert(piece.is_obstructed?(0,2))
      assert(piece.is_obstructed?(2,0))
  end

  test "out of bounds, obstructed" do
      piece = FactoryGirl.create(:piece)
      assert(piece.is_obstructed?(-1,0))
      assert(piece.is_obstructed?(0,-1))
      assert(piece.is_obstructed?(0,8))
      assert(piece.is_obstructed?(8,0))
  end

  test "King, invalid move" do
    king = FactoryGirl.create(:piece, row_pos: 1, col_pos: 2, type: "King")
    #assert(piece.valid_move?(1,2))
    assert(king.valid_move?(1,4))
  end

  test "King, valid move" do

  end
end
