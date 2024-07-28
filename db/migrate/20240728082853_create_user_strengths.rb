class CreateUserStrengths < ActiveRecord::Migration[7.1]
  def change
    create_table :user_strengths do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :no
      t.references :strength, null: false, foreign_key: true

      t.timestamps
    end
  end
end
