class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.belongs_to :player_white, index: true
      t.belongs_to :player_black, index: true
      
      t.timestamps
    end
  end
end
