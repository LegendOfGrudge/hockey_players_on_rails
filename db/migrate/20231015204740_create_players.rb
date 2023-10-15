class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :lastName
      t.string :skaterFullName
      t.string :positionCode
      t.string :shootsCatches

      t.timestamps
    end
  end
end
