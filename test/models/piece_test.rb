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

  test "King move, valid" do
      piece = FactoryGirl.create(:piece, category: "King", row_pos: 2, col_pos: 2)
      #assert(King.ancestors.inculde? Piece)
  end

  test "King move, invalid" do

  end

  test "Queen move, valid" do

  end

  test "Queen move, invalid" do

  end

  test "Castle move, valid" do

  end

  test "Castle move, invalid" do

  end

  test "Bishop move, valid" do

  end

  test "Bishop move, invalid" do

  end

  test "Knight move, valid" do

  end

  test "Knight move, invalid" do

  end

  test "Pawn move, valid" do

  end

  test "Pawn move, invalid" do

  end

end
