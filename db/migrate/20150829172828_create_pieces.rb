class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.string :position, array: true, default: []

      t.timestamps
    end
  end
end
