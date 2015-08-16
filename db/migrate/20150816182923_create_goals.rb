class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.boolean :constraint, :default => false
      t.integer :rank
      t.decimal :weight
      t.references :decision, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
