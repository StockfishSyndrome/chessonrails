require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "new page, authenticated" do
     user = FactoryGirl.create(:user)
     sign_in user
     get :new
     assert_response :success
  end

  test "new page, unauthenticated" do
      get :new
      assert_redirected_to new_user_session_path
  end

  test "create game, authenticated" do
       user = FactoryGirl.create(:user)
       sign_in user

       assert_difference 'Game.count' do
       post :create, :game => {
           :name => "The Name Game",
           :player_white_id => 1,
           :player_black_id => 2
       }
      end
      #assert_redirected_to game_path()
   end

  test "create game, unauthenticated" do

      assert_no_difference 'Game.count' do
        post :create, :game => {
            :name => "The Name Game",
            :player_white_id => 1,
            :player_black_id => 2
        }
      end
      assert_redirected_to new_user_session_path
  end

  test "create game, invalid data" do
      user = FactoryGirl.create(:user)
      sign_in user

      assert_no_difference 'Game.count' do
        post :create, :game => {
            :player_white_id => "This isn't an integer",
            :player_black_id => 2
        }
      end

      assert_response :unprocessable_entity
  end

  test "game show page" do
      user = FactoryGirl.create(:user)
      sign_in user

      game = FactoryGirl.create(:game)
      get :show, :id => game.id
      assert_response :success
  end

  test "game show page, not found" do
      user = FactoryGirl.create(:user)
      sign_in user

      get :show, :id => "LOL"
      assert_response :not_found
  end

  test "game update not logged in" do
      user = FactoryGirl.create(:user)

      game = FactoryGirl.create(:game)
      put :update, :id => game.id, :game => {:player_black_id => user.id}
      assert_redirected_to new_user_session_path
  end

  # test "game update success" do
  #     user = FactoryGirl.create(:user)
  #     sign_in user

  #     game = FactoryGirl.create(:game)
  #     put :update, :id => game.id, :game => {:player_black_id => user.id}
  #     assert_equal game.player_black_id, user.id
  #     assert_redirected_to game_path(game)
  # end

end
