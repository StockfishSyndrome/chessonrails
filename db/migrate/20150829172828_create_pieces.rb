class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :row_pos
      t.integer :col_pos
      t.belongs_to :user
      t.belongs_to :game
      t.string :category

      t.timestamps
    end
  end
end
