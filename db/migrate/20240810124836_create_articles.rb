class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.references :creator, foreign_key: { to_table: :users, column: :creator_id }

      t.timestamps
    end
  end
end
