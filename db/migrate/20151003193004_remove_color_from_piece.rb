class RemoveColorFromPiece < ActiveRecord::Migration
  def change
    remove_column :pieces, :color, :integer
  end
end
