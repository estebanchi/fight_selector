class CreateFightsFighters < ActiveRecord::Migration[6.1]
  def change
    create_table :fights_fighters do |t|
      t.references :fight, null: false, foreign_key: true
      t.references :fighter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
