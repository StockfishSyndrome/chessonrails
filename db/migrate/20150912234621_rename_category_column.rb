class RenameCategoryColumn < ActiveRecord::Migration
  def change
    rename_column :pieces, :category, :type  
  end
end
