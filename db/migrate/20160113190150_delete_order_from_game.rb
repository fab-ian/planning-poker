class DeleteOrderFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :owner, :boolean
  end
end
