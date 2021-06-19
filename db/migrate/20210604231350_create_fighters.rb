class CreateFighters < ActiveRecord::Migration[6.1]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :age
      t.float :weight
      t.string :document
      t.boolean :winner?
      t.references :level, null: false, foreign_key: true
      t.references :academy, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
