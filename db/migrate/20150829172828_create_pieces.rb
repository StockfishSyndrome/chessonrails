class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.belongs_to :user_id # t.belongs_to
      t.belongs_to :game_id
      t.string :position, array: true, default: []

      t.timestamps
    end
  end
end
