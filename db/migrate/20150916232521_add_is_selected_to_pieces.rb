class AddIsSelectedToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :is_selected, :boolean
  end
end
