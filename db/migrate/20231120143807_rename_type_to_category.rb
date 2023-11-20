class RenameTypeToCategory < ActiveRecord::Migration[7.1]
  def change
    rename_column :games, :type, :category
  end
end
