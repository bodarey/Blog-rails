class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :user_name

      t.timestamps
    end
  end
end
