class Game < ActiveRecord::Base
  belongs_to :player_white, :class_name => 'User'
  belongs_to :player_black, :class_name => 'User'

  validates :player_white_id, :numericality => {only_integer: true}
  validates :player_black_id, :numericality => {only_integer: true}
end
