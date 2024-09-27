class AddSecretToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :secret, :boolean, default: false, after: :creator_id
  end
end
