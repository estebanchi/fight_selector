class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :level
      t.float :min_weight
      t.float :max_weight

      t.timestamps
    end
  end
end
