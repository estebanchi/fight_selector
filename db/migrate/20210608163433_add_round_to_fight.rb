class AddRoundToFight < ActiveRecord::Migration[6.1]
  def change
    add_reference :fights, :round, null: false, foreign_key: true
  end
end
