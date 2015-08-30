FactoryGirl.define do

   factory :game do
        name "The Name Game"
        player_white
        player_black
   end

    factory :user, aliases:[:player_white,:player_black] do
        sequence :email do |n|
            "nguy#{n}@gmail.com"
        end
        password "12345!!!54321"
        password_confirmation "12345!!!54321"
    end

    factory :piece do
        user_id "1"
        game_id "1"
        row_pos 0
        col_pos 0
        type "rook"
        association :game
        association :user
    end

end
