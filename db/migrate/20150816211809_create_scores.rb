class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :rating
      t.decimal :value
      t.references :decision, index: true, foreign_key: true
      t.references :goal, index: true, foreign_key: true
      t.references :alternative, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
