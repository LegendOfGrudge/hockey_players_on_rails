class CreatePlayerPerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :player_performances do |t|
      t.references :player, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true
      t.integer :evGoals
      t.integer :evPoints
      t.decimal :faceoffWinPct
      t.integer :gameWinningGoals
      t.integer :gamesPlayed
      t.integer :goals
      t.integer :otGoals
      t.integer :penaltyMinutes
      t.integer :plusMinus
      t.integer :points
      t.decimal :pointsPerGame
      t.integer :ppGoals
      t.integer :ppPoints
      t.integer :shGoals
      t.decimal :shootingPct
      t.integer :shots
      t.decimal :timeOnIcePerGame

      t.timestamps
    end
  end
end
