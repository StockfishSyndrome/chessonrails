class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :position, array: true, default: []

      t.timestamps
    end
  end
end
