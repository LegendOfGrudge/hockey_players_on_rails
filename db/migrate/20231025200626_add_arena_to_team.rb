class AddArenaToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :arena, :string
    add_column :teams, :address, :string
  end
end
