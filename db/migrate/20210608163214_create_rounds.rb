class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.integer :number
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
