require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "populate board" do
     game = FactoryGirl.create(:game)
     game.populate_board
     assert_equal 32, game.pieces.count
     assert_equal 16, game.player_white.pieces.count
     assert_equal 16, game.player_black.pieces.count
  end
end
