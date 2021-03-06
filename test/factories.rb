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
        type "Pawn"
        association :game, :id => 999
        association :user
    end

    factory :king do
        row_pos 1
        col_pos 2
        association :game, :id => 999
        association :user
    end

    factory :pawn do
        row_pos 1
        col_pos 2
        association :game, :id => 999
        association :user
    end

    factory :knight do
        row_pos 1
        col_pos 2
        association :game, :id => 999
        association :user
    end

    factory :queen do
        row_pos 1
        col_pos 2
        association :game, :id => 999
        association :user
    end

    factory :rook do
        row_pos 1
        col_pos 2
        association :game, :id => 999
        association :user
    end

    factory :bishop do
        row_pos 1
        col_pos 2
        association :game, :id => 999
        association :user
    end
    

end
