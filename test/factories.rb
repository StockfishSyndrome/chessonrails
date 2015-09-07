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
        row_pos 1
        col_pos 1
        type "pawn"
        association :game, :id => 999
        association :user
    end

end
