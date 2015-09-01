class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    has_many :pieces

    has_many :games_as_white, :class_name => 'Game', :foreign_key => 'player_white_id'
    has_many :games_as_black, :class_name => 'Game', :foreign_key => 'player_black_id'

end
