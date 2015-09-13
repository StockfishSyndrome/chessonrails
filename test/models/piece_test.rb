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
    k = FactoryGirl.create(:king)
    assert(!k.valid_move?(1,4))
  end

  test "King, valid move" do
    k = FactoryGirl.create(:king)
    assert(k.valid_move?(1,3))
  end

  test "King, skipped move" do
    k = FactoryGirl.create(:king)
    assert(!k.valid_move?(1,2))
  end

  test "King type" do
      k = FactoryGirl.create(:king)
      assert_equal(k.type, "King")
  end

  test "Bishop type" do
      k = FactoryGirl.create(:bishop)
      assert_equal(k.type, "Bishop")
  end

  test "Knight type" do
      k = FactoryGirl.create(:knight)
      assert_equal(k.type, "Knight")
  end

  test "Pawn type" do
      k = FactoryGirl.create(:pawn)
      assert_equal(k.type, "Pawn")
  end

  test "Queen type" do
      k = FactoryGirl.create(:queen)
      assert_equal(k.type, "Queen")
  end

  test "Rook type" do
      k = FactoryGirl.create(:rook)
      assert_equal(k.type, "Rook")
  end

  test "Pawn, valid move" do
  game = FactoryGirl.create(:game)
  pawn = FactoryGirl.create(:pawn, game_id: game.id, user_id: game.player_black.id,row_pos: 1, col_pos: 2)
  assert(pawn.valid_move?(2,2))
    end

test "Pawn, invalid move" do
  pawn = FactoryGirl.create(:pawn, row_pos: 1, col_pos: 2)
  assert(!pawn.valid_move?(2,4))
    end

test "Pawn valid first_move" do
  game = FactoryGirl.create(:game)
  pawn = FactoryGirl.create(:pawn, game_id: game.id, user_id: game.player_black.id,row_pos: 1, col_pos: 2)
  assert(pawn.valid_move?(3,2))
end

test "Pawn invalid first_move" do
  game = FactoryGirl.create(:game)
  pawn = FactoryGirl.create(:pawn, game_id: game.id, user_id: game.player_black.id,row_pos: 1, col_pos: 0)
  assert(!pawn.valid_move?(4,0))
end

test "Pawn invalid backwards move" do
  game = FactoryGirl.create(:game)
  pawn = FactoryGirl.create(:pawn, game_id: game.id, user_id: game.player_black.id,row_pos: 3, col_pos: 2)
  assert(!pawn.valid_move?(2,2))
end

test "Pawn, skipped move" do
  pawn = FactoryGirl.create(:pawn)
  assert(!pawn.valid_move?(1,2))
end


    test "Knight, valid move" do
        knight = FactoryGirl.create(:knight, row_pos: 2, col_pos: 4)
        assert(knight.valid_move?(0,5))
    end

    test "Knight, invalid diagonal move" do
        knight = FactoryGirl.create(:knight, row_pos: 1, col_pos: 1)
        assert(!knight.valid_move?(2,2))
    end

    test "Knight, invalid horizontal move" do
        knight = FactoryGirl.create(:knight, row_pos: 1, col_pos: 1)
        assert(!knight.valid_move?(1,2))
    end

    test "Knight, invalid vertical move" do
        knight = FactoryGirl.create(:knight, row_pos: 1, col_pos: 1)
        assert(!knight.valid_move?(0,1))
    end

    test "Knight, skipped move" do
        knight = FactoryGirl.create(:knight, row_pos: 1, col_pos: 1)
        assert(!knight.valid_move?(1,1))
    end
end
