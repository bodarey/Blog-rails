class RenameUsercolumn < ActiveRecord::Migration[6.0]
  def change
rename_column :comments, :user, :user_name

  end
end
