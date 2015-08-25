class Game < ActiveRecord::Base
    has_many :users, :through => :matches
    has_many :matches
end
