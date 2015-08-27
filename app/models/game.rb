class Game < ActiveRecord::Base
    has_many :users
    validates :player_one_id, :presence => true, :numericality => { only_integer: true}
    validates :player_two_id, :presence => true, :numericality => { only_integer: true}
end
