class AddScoreToAlternatives < ActiveRecord::Migration
  def change
    add_column :alternatives, :score, :decimal
  end
end
