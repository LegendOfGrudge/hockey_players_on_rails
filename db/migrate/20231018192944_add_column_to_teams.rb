class AddColumnToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :city, :string
    add_column :teams, :title, :string
  end
end
