class AddOpenToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :open, :boolean, default: false, after: :creator_id
  end
end
