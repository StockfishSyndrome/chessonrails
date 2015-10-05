class AddPlayerTurnToGame < ActiveRecord::Migration
  def change
    add_column :games, :player_turn, :integer, :default => 1
  end
end
