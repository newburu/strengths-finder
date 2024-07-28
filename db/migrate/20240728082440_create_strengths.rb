class CreateStrengths < ActiveRecord::Migration[7.1]
  def change
    create_table :strengths do |t|
      t.string :name_en
      t.string :name_ja

      t.timestamps
    end
  end
end
