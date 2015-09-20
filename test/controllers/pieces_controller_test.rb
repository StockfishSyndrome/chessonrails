require 'test_helper' 
class PiecesControllerTest < ActionController::TestCase
  
  test "select piece success" do 
    game = FactoryGirl.create(:game)
    game.populate_board
    piece = game.pieces.last
    get :select, :id => piece.id  
    assert(piece.is_selected?)
  end
 

end
