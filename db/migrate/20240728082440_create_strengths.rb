class CreateStrengths < ActiveRecord::Migration[7.1]
  def change
    create_table :strengths do |t|
      t.string :name_en
      t.string :name_ja
      t.integer :kind
      t.text :comment

      t.timestamps
    end
  end
end
